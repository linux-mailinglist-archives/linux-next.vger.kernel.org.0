Return-Path: <linux-next+bounces-6023-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F6EA71BAC
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 17:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2C2C5189B88C
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 16:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC1D1F5850;
	Wed, 26 Mar 2025 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="QS8p2MJB"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com [52.119.213.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD41F5433;
	Wed, 26 Mar 2025 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.119.213.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743006085; cv=none; b=kyU8pegQ4fXuBpb2vKxWQ1qfSHNl9XJT4sPbMvy6H7TuY5ZutVRsIrcsmYikLf+URNuadSlAG7iBs9vEpaIblfU3Q8jdJh1xFzaoTqK0jO/VZHpUt9lz3XsZ4T7rvOgYBQQ2jMi0z2FvGrOV0ZLc7RzWwU4iXJcfBw9ml82UCGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743006085; c=relaxed/simple;
	bh=nT6VRtgopQ8G6LxyrDepOfBp6qLTXcRbja01PY+hu7M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=n60JBnKj17gW5I1GaZVYeBi2ThsUtNFALdhb2mR54ZxAJuCvBem8E4myG7HfmMB2Y1ruqs/A2QSH/dvUycjXrHmfALooQdzrZJX/FFFAGX0KDszE/6bzeEYadUwQYgorESwJVqnY7aevYJ8FIBt+YLJf8vbjjVGDSLxipYMjmkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.co.jp; dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b=QS8p2MJB; arc=none smtp.client-ip=52.119.213.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.co.jp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1743006084; x=1774542084;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nhr7gIYRxszAnMd29YWnQ+sqjq5QqSN5i/GFVwNuhZA=;
  b=QS8p2MJBdiua1B492roh7kCbYQWNqmt7NC0MFSIZApqKL0G4ayyLbE3n
   SHJEtiEflx0/IEHC8d70Z+MOqeMFDIqjfGley9I8oGQUB3WQcgEIZ4Nx8
   9uRd9UM6nTWYIEbLYfo178Oy43S5AO6rku69oWusY/xVmH/u30aDSnldh
   4=;
X-IronPort-AV: E=Sophos;i="6.14,278,1736812800"; 
   d="scan'208";a="77909939"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.43.8.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2025 16:21:19 +0000
Received: from EX19MTAUWC002.ant.amazon.com [10.0.21.151:64354]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.9.87:2525] with esmtp (Farcaster)
 id 1abbc2fe-9a1d-48e3-9635-300968de39f9; Wed, 26 Mar 2025 16:21:18 +0000 (UTC)
X-Farcaster-Flow-ID: 1abbc2fe-9a1d-48e3-9635-300968de39f9
Received: from EX19D004ANA001.ant.amazon.com (10.37.240.138) by
 EX19MTAUWC002.ant.amazon.com (10.250.64.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 26 Mar 2025 16:21:17 +0000
Received: from 6c7e67bfbae3.amazon.com (10.106.100.44) by
 EX19D004ANA001.ant.amazon.com (10.37.240.138) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1544.14;
 Wed, 26 Mar 2025 16:21:14 +0000
From: Kuniyuki Iwashima <kuniyu@amazon.com>
To: <kuba@kernel.org>
CC: <davem@davemloft.net>, <john.johansen@canonical.com>, <kuniyu@amazon.com>,
	<linux-kernel@vger.kernel.org>, <linux-next@vger.kernel.org>,
	<netdev@vger.kernel.org>, <pabeni@redhat.com>, <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the apparmor tree
Date: Wed, 26 Mar 2025 09:19:56 -0700
Message-ID: <20250326162104.20801-1-kuniyu@amazon.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250326042655.4e160022@kernel.org>
References: <20250326042655.4e160022@kernel.org>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D044UWB004.ant.amazon.com (10.13.139.134) To
 EX19D004ANA001.ant.amazon.com (10.37.240.138)

From: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 26 Mar 2025 04:26:55 -0700
> On Wed, 26 Mar 2025 15:01:48 +1100 Stephen Rothwell wrote:
> > After merging the apparmor tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> > 
> > security/apparmor/af_unix.c: In function 'unix_state_double_lock':
> > security/apparmor/af_unix.c:627:17: error: implicit declaration of function 'unix_state_lock'; did you mean 'unix_state_double_lock'? [-Wimplicit-function-declaration]
> >   627 |                 unix_state_lock(sk1);
> >       |                 ^~~~~~~~~~~~~~~
> >       |                 unix_state_double_lock
> > security/apparmor/af_unix.c: In function 'unix_state_double_unlock':
> > security/apparmor/af_unix.c:642:17: error: implicit declaration of function 'unix_state_unlock'; did you mean 'unix_state_double_lock'? [-Wimplicit-function-declaration]
> >   642 |                 unix_state_unlock(sk1);
> >       |                 ^~~~~~~~~~~~~~~~~
> >       |                 unix_state_double_lock
> 
> Thanks Stephen! I'll pop this into the tree in a few hours,
> just giving Kuniyuki a bit more time to ack.

Thanks for catching this, Stephen !

The patch itself looks good, for the patch:

Reviewed-by: Kuniyuki Iwashima <kuniyu@amazon.com>


John:

I had a cursory look at this commit and the exact user of
unix_state_lock() is broken for SOCK_DGRAM.

https://web.git.kernel.org/pub/scm/linux/kernel/git/jj/linux-apparmor.git/commit/?h=apparmor-next&id=c05e705812d179f4b85aeacc34a555a42bc4f9ac

---8<---
+
+	/* TODO: update sock label with new task label */
+	unix_state_lock(sock->sk);
+	peer_sk = unix_peer(sock->sk);
+	if (peer_sk)
+		sock_hold(peer_sk);
+
+	is_sk_fs = is_unix_fs(sock->sk);
+	if (is_sk_fs && peer_sk)
+		sk_req = request;
+	if (sk_req)
+		error = unix_label_sock_perm(subj_cred, label, op, sk_req,
+					     sock);
+	unix_state_unlock(sock->sk);
+	if (!peer_sk)
+		return error;
+
+	unix_state_double_lock(sock->sk, peer_sk);

Here, unix_peer(sock->sk) could have been changed and must be
double checked.  See unix_dgram_sendmsg().

The patch seems to be written in 2022 and recently merged.
I'm not sure if it's reviewed by netdev folks at that time,
but please cc me and netdev next time for patches regarding
AF_UNIX.

Thanks!


+	if (!is_sk_fs && is_unix_fs(peer_sk)) {
+		last_error(error,
+			   unix_fs_perm(op, request, subj_cred, label,
+					unix_sk(peer_sk)));
+	} else if (!is_sk_fs) {
+		struct aa_sk_ctx *pctx = aa_sock(peer_sk);
+
+		last_error(error,
+			xcheck(aa_unix_peer_perm(subj_cred, label, op,
+						 MAY_READ | MAY_WRITE,
+						 sock->sk, peer_sk, NULL),
+			       aa_unix_peer_perm(file->f_cred, pctx->label, op,
+						 MAY_READ | MAY_WRITE,
+						 peer_sk, sock->sk, label)));
+	}
+	unix_state_double_unlock(sock->sk, peer_sk);
---8<---

