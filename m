Return-Path: <linux-next+bounces-6806-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C359DAB95E5
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 08:23:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F437501649
	for <lists+linux-next@lfdr.de>; Fri, 16 May 2025 06:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6B5223329;
	Fri, 16 May 2025 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="buN4rWEW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB52149DF0;
	Fri, 16 May 2025 06:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747376588; cv=none; b=svhXFLyeKpYMeowW92sztrxhZMwQeW59osxkvorgHPu42SA5pl5JRz2KL1zA4Im5uPMQjaeYdpCuSu46frRfS5ihwZ2lLDfL+2N1jTWRqZ9iQWJ/gqpal068OE25Pp7LDpr/AwbQWOmVt7wG2kRy7LV0pgIBbdPw9ebefAjhpSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747376588; c=relaxed/simple;
	bh=kAqlUSjGQ7XVoDiauuw37jXI/mkgMBH06rOVBpOtey0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=O298mUFAGj0sD0ZyOO78Q5heuk+y6/5zAHj7/f3J2z6avFgqOgZVhCyt3thARSqs4ISeUcFjSTGGBaAG0LFkJV8aLxpohmTfs8OOyVL3B/Qi7TmnJPGzi+jzAon1iZhz0LiIbyk3EkPLVOkwSGAPAAjBl8CHCZH011skeBg9qsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=buN4rWEW; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=202503; t=1747376583;
	bh=61rzR6yyeTYJhtqbC+3q3R5b8i5Ra9N5t38Ao6d8M0I=;
	h=Date:From:To:Cc:Subject:From;
	b=buN4rWEWF/jjUmGcRJtc4l/VrnFLg7pPtF7tHJtxyrllYG51iApcIajfGeJLWiiA3
	 LUnw2PQFT+HevhmbRJZ1LdXXlwKURQxaB7ljsTQpydgMWZl6XHRAguImrlMWfMV/vx
	 lAIuYdoRSE92cAi4lHdelqQh1iCH0lI8RO1J87SJPxUWLzadcp9jhkX6QKSQCJ9XN6
	 4wJL1t9f3nBOTNZoV04OVEkD+rX6avj2O+l73id+OAzU4YfZcFBsW7Mi8g7p26pumJ
	 6codrccu5DvskmC60gG6sWRjMe7tF1HvcHbF5Scs6sKRjTM4g4NxWrq2iBbo5tTz43
	 ZpawER16lsy5Q==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4ZzH7p45zbz4xG4;
	Fri, 16 May 2025 16:23:01 +1000 (AEST)
Date: Fri, 16 May 2025 16:23:01 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, David Miller <davem@davemloft.net>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Networking <netdev@vger.kernel.org>, Breno Leitao <leitao@debian.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>
Subject: linux-next: manual merge of the ftrace tree with the net-next tree
Message-ID: <20250516162301.6c5d2d3c@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/MhmGtAwXzQPCV1yRg=qNL6I";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/MhmGtAwXzQPCV1yRg=qNL6I
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the ftrace tree got a conflict in:

  include/trace/events/tcp.h

between commit:

  0f08335ade71 ("trace: tcp: Add tracepoint for tcp_sendmsg_locked()")

from the net-next tree and commit:

  ac01fa73f530 ("tracepoint: Have tracepoints created with DECLARE_TRACE() =
have _tp suffix")

from the ftrace tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc include/trace/events/tcp.h
index 006c2116c8f6,4f9fa1b5b89b..000000000000
--- a/include/trace/events/tcp.h
+++ b/include/trace/events/tcp.h
@@@ -332,31 -259,7 +332,31 @@@ TRACE_EVENT(tcp_retransmit_synack
  		  __entry->saddr_v6, __entry->daddr_v6)
  );
 =20
 +TRACE_EVENT(tcp_sendmsg_locked,
 +	TP_PROTO(const struct sock *sk, const struct msghdr *msg,
 +		 const struct sk_buff *skb, int size_goal),
 +
 +	TP_ARGS(sk, msg, skb, size_goal),
 +
 +	TP_STRUCT__entry(
 +		__field(const void *, skb_addr)
 +		__field(int, skb_len)
 +		__field(int, msg_left)
 +		__field(int, size_goal)
 +	),
 +
 +	TP_fast_assign(
 +		__entry->skb_addr =3D skb;
 +		__entry->skb_len =3D skb ? skb->len : 0;
 +		__entry->msg_left =3D msg_data_left(msg);
 +		__entry->size_goal =3D size_goal;
 +	),
 +
 +	TP_printk("skb_addr %p skb_len %d msg_left %d size_goal %d",
 +		  __entry->skb_addr, __entry->skb_len, __entry->msg_left,
 +		  __entry->size_goal));
 +
- DECLARE_TRACE(tcp_cwnd_reduction_tp,
+ DECLARE_TRACE(tcp_cwnd_reduction,
  	TP_PROTO(const struct sock *sk, int newly_acked_sacked,
  		 int newly_lost, int flag),
  	TP_ARGS(sk, newly_acked_sacked, newly_lost, flag)

--Sig_/MhmGtAwXzQPCV1yRg=qNL6I
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmgm2cUACgkQAVBC80lX
0Gy1XAf/TQNrX/392lAmxGaLAFewkcu0ip+zR8lrguAon5p8FrCWHj4SSCuxtDXu
JtzjbscSAqXI79g2B1wV4V/nSnFtHap4hlck41s6OR+hRK3TnzBj44mzOJ22mF3M
1+gkfAaCA/zmyk2FuGL7tH+AdqOyozOgISi8iSU6P9zLcj1ubLclarC0hWf3+Vv/
rNbjN37pL7QnZ8TMMq2Wknb/5QrXJphmFaMHrqGl8w9lOyDYaiDI+yqsPLz0t5gr
RRinFkOV+pO8dKgvBGRLC1YtKTI+xctsu2JhOltRfs10ad5dt8/jUps8i1HOPq47
BCn28/dbzl5d4fc4N/7Y31wEx6Zqdw==
=ELlq
-----END PGP SIGNATURE-----

--Sig_/MhmGtAwXzQPCV1yRg=qNL6I--

