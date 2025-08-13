import unittest
import json
from app import app

class AppTestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    def test_get_numbers(self):
        response = self.app.get('/api/numbers')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.content_type, 'application/json')
        data = json.loads(response.get_data(as_text=True))
        self.assertIsInstance(data, list)
        self.assertEqual(len(data), 100)
        self.assertEqual(data[0], 1)
        self.assertEqual(data[99], 100)

    def test_get_alphabet(self):
        response = self.app.get('/api/alphabet')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.content_type, 'application/json')
        data = json.loads(response.get_data(as_text=True))
        self.assertIsInstance(data, list)
        self.assertEqual(len(data), 26)
        self.assertEqual(data[0], 'A')
        self.assertEqual(data[25], 'Z')

    def test_get_current_affairs(self):
        response = self.app.get('/api/current-affairs')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.content_type, 'application/json')
        data = json.loads(response.get_data(as_text=True))
        self.assertIsInstance(data, list)
        self.assertGreater(len(data), 0)
        self.assertIsInstance(data[0], str)

if __name__ == '__main__':
    unittest.main()
