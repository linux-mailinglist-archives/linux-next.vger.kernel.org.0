Return-Path: <linux-next+bounces-4408-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2FC9ADAEF
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 06:32:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0915C1C21A90
	for <lists+linux-next@lfdr.de>; Thu, 24 Oct 2024 04:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66C6CBA4B;
	Thu, 24 Oct 2024 04:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.deadmansswitch.net header.i=@mail.deadmansswitch.net header.b="H7XVvbSY"
X-Original-To: linux-next@vger.kernel.org
Received: from pc232-13.mailgun.net (pc232-13.mailgun.net [143.55.232.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB17F17085C
	for <linux-next@vger.kernel.org>; Thu, 24 Oct 2024 04:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=143.55.232.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729744350; cv=none; b=YAY5SDqDGTlPHRPFY9cyFFSO9JcvNjALGidtpt/Pb9vRhVad5j+xCYfZG2mBo8BCAn4cofUqgKZ00sS+4KAnzu5QNiUerpbuEFrGwHalFSzTUAkd7jcYmQIXXTKeJc7UhWdXiDiNJGIuDGZedUpx4DoI5aOs9UkH0zrZMAscwOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729744350; c=relaxed/simple;
	bh=uMynWb2r7LDJpywGQ4jLdoaAysi4gwiYQUh4UIrRHac=;
	h=Content-Type:MIME-Version:Subject:From:To:Date:Message-ID; b=ZILTmxyOZAh6n/DLH+pxOhi+eHGHsFzBk+bd30Sh0BLvzuWqOvhmaH3f5gWm2xRe1EL6FvfKmhWKb9Mo0NnyWeXyCaOsK4ex7tkxCpSpVroyEoEys9RI3WJ0UxP4RQvyS/pn4mYZx6ixCRNu7C0fllXsqTMI5kUxcg54do2pIKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deadmansswitch.net; spf=pass smtp.mailfrom=mail.deadmansswitch.net; dkim=pass (2048-bit key) header.d=mail.deadmansswitch.net header.i=@mail.deadmansswitch.net header.b=H7XVvbSY; arc=none smtp.client-ip=143.55.232.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deadmansswitch.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.deadmansswitch.net
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mail.deadmansswitch.net; q=dns/txt; s=krs; t=1729744344; x=1729751544;
 h=Message-ID: Date: To: To: From: From: Subject: Subject: Content-Transfer-Encoding: MIME-Version: Content-Type: Sender: Sender;
 bh=uMynWb2r7LDJpywGQ4jLdoaAysi4gwiYQUh4UIrRHac=;
 b=H7XVvbSYqThmDyW1ozB8CvNjqSqMRm+IirXm/Waca1eSSjQapHqFxdmp85spsiNNxIBEYDvsiygn2pvpmmmeHzbnGQLX4lqjNLF7y/+tZCQOEQbMzk2HEHt2qR/l3o2HE6GlH/jqj5gjvCohDOI1LRRKq3RR+6ScdPmutE8/WhEdiWvFuKEDDBnnY2+vWKIsZd8vXbt3Z1E39u6IbGAZ/6H93aonjwJkpVB/97T2Rs4s+9hsFg9apvt4+JJudC/vLlvVhTzNAq+CsK5BdA67Gi9fVXhH2063QZdHUsZTVcEXN3a+I+jDjaDGGR0f+5sLfdeQckODS+vfKnrezuTnTA==
X-Mailgun-Sending-Ip: 143.55.232.13
X-Mailgun-Sending-Ip-Pool-Name: 
X-Mailgun-Sending-Ip-Pool: 
X-Mailgun-Sid: WyJkYzAzYyIsImxpbnV4LW5leHRAdmdlci5rZXJuZWwub3JnIiwiY2FkMjk4Il0=
Received: from d5caf0f646d0 (projects.stochastic.io [195.201.40.251]) by 3a270c85ffb2
 with SMTP id 6719cdd8fb674d5c8063763a; Thu, 24 Oct 2024 04:32:24 GMT
Sender: donotreply=deadmansswitch.net@mail.deadmansswitch.net
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Your login link
From: Dead Man's Switch notification service <donotreply@deadmansswitch.net>
To: linux-next@vger.kernel.org
Date: Thu, 24 Oct 2024 04:32:24 -0000
Message-ID: <172974434440.17.14223049657232313596@d5caf0f646d0>

Hello!

This email contains your secret Dead Man's Switch login link. To log in,
just click the link below, and please don't share it with anyone, or they will
be able to access your account.

Click to log in:

https://www.deadmansswitch.net/auth/login/wCrumam2/

Please note that the link will expire a few minutes after you requested it, and you
might need to request a new one if this one doesn't work.

If you didn't request a login link, you can safely ignore this email.

Thanks!
The Dead Man's Switch team

