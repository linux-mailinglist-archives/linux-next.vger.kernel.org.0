Return-Path: <linux-next+bounces-5614-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3808BA49892
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 12:52:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 39801174120
	for <lists+linux-next@lfdr.de>; Fri, 28 Feb 2025 11:52:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9845225D90E;
	Fri, 28 Feb 2025 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coldcon.co.za header.i=@coldcon.co.za header.b="Inb4e/7N"
X-Original-To: linux-next@vger.kernel.org
Received: from outgoing59.jnb.host-h.net (outgoing59.jnb.host-h.net [156.38.154.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF2723E32A
	for <linux-next@vger.kernel.org>; Fri, 28 Feb 2025 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.38.154.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743559; cv=none; b=Rf+qxcDHQYupW4E9y9jFd05r358YsXj1d/WMycCffUyzsM0KKd3RCDHajWjQr+Nk39OR3Q3kXkxeObV0x1LEACAh8h5WRAjMvjHiED33VUUksl80r9OaWUAORxW+RxSFD4i1h7PClyGK6NCvmFPf4qmDm5p4MGRocTLDSED4Img=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743559; c=relaxed/simple;
	bh=LnJAb5OtSiiPPpVmdSEicOxdfy335XXtHun9Lv2d8Bw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Ui16JjmyI/Q7Q+e+Mj312Z3QvSA+BGiDA1cToc3jOpyq2akGmw1GhJrVH6XYdPGb44voOXDLreAXxyYsltKDg0QKssoptwun+9yTbdZz2hqwCvJToJX07SgeV10Jg3CFzRg5r56G5MzWG8wPhVvdt0PZyCMAM/F93tsMn6ddN5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coldcon.co.za; spf=fail smtp.mailfrom=coldcon.co.za; dkim=pass (2048-bit key) header.d=coldcon.co.za header.i=@coldcon.co.za header.b=Inb4e/7N; arc=none smtp.client-ip=156.38.154.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coldcon.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=coldcon.co.za
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=coldcon.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:sender:cc:bcc:
	in-reply-to:references; bh=t+qwmUT3iOAm1DfPM+nbVN5TXLHXkSwi3Xte37fm8Y0=; b=In
	b4e/7NN5oIXPiyeJMhWcYjxdpP6LPFIZs56p813YSiUWGeBO9IU7/4knqqgnAGyjtxo6ZEXFFeU6f
	qDySJ5os1VSYT8xVwMlh2t0yg9GUtMQmLlBqfqXrvcTQre4P7lMgCOU6IEEan3aygzjiPGPkX5UUG
	7hxeCZUqkecbQgbTQmxUEU3HxV6ZCVYodsvNjcmfPTve/Rj3fG33G5aUTNQu+XFeqWS53K3EQcr1U
	8eDfZN023ulIc5cRL480xQa4sdiwMVx2gN7fbN/S28U7sC8LO7fyZBr7vCSDMpIZE6jWYTH8F20k7
	mGpGPIO1AWGBk1WhpN98Ws3vdI88f2BA==;
Received: from dedi166.jnb2.host-h.net ([41.203.16.166])
	by antispam8-jnb1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <avaril@coldcon.co.za>)
	id 1tnyuv-009Cyc-1W
	for linux-next@vger.kernel.org; Fri, 28 Feb 2025 13:52:34 +0200
Received: from [104.192.5.240] (helo=coldcon.co.za)
	by dedi166.jnb2.host-h.net with esmtpsa (TLS1.2:ECDHE_SECP521R1__RSA_SHA512__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <avaril@coldcon.co.za>)
	id 1tnyuu-000000063yv-0nW8
	for linux-next@vger.kernel.org;
	Fri, 28 Feb 2025 13:52:32 +0200
Reply-To: funding@investorstrustco.net
From: Iyke Nikolas <avaril@coldcon.co.za>
To: linux-next@vger.kernel.org
Subject: Re: The Business Loan/financing.
Date: 28 Feb 2025 11:52:28 +0000
Message-ID: <20250228112431.E5EB097F6E64AD10@coldcon.co.za>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: avaril@coldcon.co.za
X-Virus-Scanned: Clear
X-SpamExperts-Domain: coldcon.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@coldcon.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.88)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+CzanhUpQxxY0jGcn2Rs0cPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xV3WYIDmHRmj++kf4Wt638t8C9mOBdONdnsxgsk1D2pw/C
 h5SE4jAyhe1COeASyU+tPYUpwl7fr6szzxGpbJGM4ld5rdi2ZxohSIq+dqifZkpZxh+FYJ0h9sMd
 fUgKrYi2nL3jbWASEhACDL4kI3o17pQ7j3jCJTtfQJsYFuLaN1P+2pX3Ri+Sxf5TYh9IJWcl2z4A
 MwIeDamCCvjsoy8UhlmaBog7cT6M0uhzKVr8lMk2UIHTjO0tKRhzCIXD0CZh8eXuGDB+WvlcaPhs
 +IMOUdShXBqjIqKx5jnB7z3Yhhp3eWzGQOuNjEBo/WEbPRDIZwKDK1Qy7Yn0clcDVSjgtbaLfdxI
 2xBN3cmR7dNBzLm8D0lCIgUANkVen5FLPBiV/c7g31viaan27/VsoWnQPP2nZVsMwXoTZLRadQLt
 9HGlfXdmgJrKjBlTpWs78y8XcyZ/7+cSpFkndHGnqif7SugB+UXSiJRAsNSvmUSSESCv9TR+UxzL
 ZWL8hwGBjhoiDZaHjjUjL+gPrBh/8n4kpYzALSfDrtQHo6yRgtyrJRn+FcjOYeF2HwnZJhvtM/n+
 87pbuOY9h7niXhyjhhf0Ob9VvWFMtHJ9Nj19xFqN66ACEQc7i66bLHUN4mCUQMLxpEs8sWmhpCJq
 IKaaP6UNsV+DkDiP1EOo5xXzAYM8DnYMaEdzhd2lXSegpXuKHAbyuRFW4LkqXMoPG0pCvqU9uBGL
 4361D/k5e59gCUqHufry/aB9fIjlzSMwQtE1uuQn3ErF2CTwghucT6uUXGpYRkPBmL/1LcF5vMVN
 yLbNkR3A/D2Fw8yava9u/f+NOJN+pvlHhV6a5QjptwQBGybQTP/4Wa3TElWiul6TzMiqaiMb3h4V
 3jrsdkLhM9vHUxJTthwjEMTyG4lRMpG4PwYMovIJzflUDtG9b8caIarEvYzeNrIm5XwFIoLIN5i1
 2sMZO/bReuqCxob5eNOvihWc
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-Complaints-To: abuse@antispammaster.host-h.net

Hello,

Do you require capital financing or low interest loans to advance=20
your business projects or growth strategy? We can provide with=20
the needed investments for your business. 

Get back to me if interested?

Best regards,


Iyke Nikolas
Managing Partner
Investors Trust

