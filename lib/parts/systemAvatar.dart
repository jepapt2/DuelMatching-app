String systemAvatar() {
  const flavor = String.fromEnvironment('FLAVOR');
  switch (flavor) {
    case 'development':
      return 'https://firebasestorage.googleapis.com/v0/b/duelmatching.appspot.com/o/asset%2F%E6%83%85%E5%A0%B1%E3%82%A2%E3%82%A4%E3%82%B3%E3%83%B3.png?alt=media&token=0c1f2669-9bc9-4867-afd3-b0db50a93b66';
    default:
      return 'https://firebasestorage.googleapis.com/v0/b/duelmatching-5562b.appspot.com/o/asset%2F%E6%83%85%E5%A0%B1%E3%82%A2%E3%82%A4%E3%82%B3%E3%83%B3.png?alt=media&token=c29c45a2-5214-411a-a358-16b6d80b121f';
  }
}
