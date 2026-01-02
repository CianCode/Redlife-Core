import { BrowserRouter, Routes, Route } from 'react-router-dom';

function LoadingPage() {
  return (
    <div style={{ display: 'flex', justifyContent: 'center', alignItems: 'center', height: '100vh' }}>
      <h1>RedLife Roleplay</h1>
    </div>
  );
}

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<LoadingPage />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
