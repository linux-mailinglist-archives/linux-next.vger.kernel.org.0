Return-Path: <linux-next+bounces-7810-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A20FCB17CEB
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 08:29:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 34A701C2437B
	for <lists+linux-next@lfdr.de>; Fri,  1 Aug 2025 06:29:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE4E01F3D54;
	Fri,  1 Aug 2025 06:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=163.com header.i=@163.com header.b="Blto+PeN"
X-Original-To: linux-next@vger.kernel.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D70DB1E990E;
	Fri,  1 Aug 2025 06:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754029742; cv=none; b=TqXRvKJNDZjfsnlp6BS1r1L8EC/bucFeeRZFf62onQA1gge+2c+YwkW4RqUH/E2Df0eZmHM9gLCw5EyLEPoeU/O5ba3REdO9Jua/TpLcYKcq07yrkayE2SMiivd9FUCMqDemo+Hoio4d/yMNULiSaLw5PS5yoUy0x/F4Lp9uh7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754029742; c=relaxed/simple;
	bh=TZGG7jmoZvxkE/IKFE16zmJqWQQALJW+8CQ4vDqU3wU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=qR5vOyDtXMKwZqcyzTddKzBu2m2c77+YkU2WqbqtCaYZeQ8FzqaAxg6J14gMZwugt0ZPWNcWvNixbAwXiAWwe7oWoH/CdaTyJlerdIVQdyugwtRhCRQ307lotxht2jUo3tkA3SG9HBe5LbapjwGrEqbNRlUlnQ/46F9HjjMQbvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=fail (1024-bit key) header.d=163.com header.i=@163.com header.b=Blto+PeN reason="signature verification failed"; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=dC9KBw4sEw7jTJErqmakBD0kKQgNF16I4/sEVGhGTmY=; b=B
	lto+PeNwDpC8srkaginYB0U4gqIN9WJWFIvDk/BYFkvbLN/wEXkrGQc9WrLOEh7f
	lFA9ylmVjq8RcKzFsX8aJS4g+lnPwffLO8+9FW//6jEo2yjq6TIryofG9mNQuP6Q
	04BwBQBgM4eH5glWunGbU7YqHVPxALQU+lnOoIS9sg=
Received: from andyshrk$163.com ( [58.22.7.114] ) by
 ajax-webmail-wmsvr-40-100 (Coremail) ; Fri, 1 Aug 2025 14:28:09 +0800 (CST)
Date: Fri, 1 Aug 2025 14:28:09 +0800 (CST)
From: "Andy Yan" <andyshrk@163.com>
To: "Stephen Rothwell" <sfr@canb.auug.org.au>
Cc: "Simona Vetter" <simona.vetter@ffwll.ch>,
	"Andy Yan" <andy.yan@rock-chips.com>,
	"Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
	"Intel Graphics" <intel-gfx@lists.freedesktop.org>,
	DRI <dri-devel@lists.freedesktop.org>,
	"Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
	"Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re:Re: linux-next: build warning after merge of the drm-misc tree
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.14 build 20250519(9504565a)
 Copyright (c) 2002-2025 www.mailtech.cn 163com
In-Reply-To: <20250801144354.0ac00f39@canb.auug.org.au>
References: <20250716203115.6e02e50c@canb.auug.org.au>
 <20250801144354.0ac00f39@canb.auug.org.au>
X-NTES-SC: AL_Qu2eBvyZtk4j7yCcZekfmkcVgOw9UcO5v/Qk3oZXOJF8jCrp+T8Sd2ZaF1DE/tCJOQeHiwGOexp84/ZoY4N9R58o3UA/dpqW8flVjzX0UsNm4w==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <7304e450.4ca8.198645108de.Coremail.andyshrk@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZCgvCgDnT_15XoxoQz8LAA--.23127W
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgCcXmiMTk2huQACst
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

CkhlbGxv77yMCgpBdCAyMDI1LTA4LTAxIDEyOjQzOjU0LCAiU3RlcGhlbiBSb3Rod2VsbCIgPHNm
ckBjYW5iLmF1dWcub3JnLmF1PiB3cm90ZToKPkhpIGFsbCwKPgo+T24gV2VkLCAxNiBKdWwgMjAy
NSAyMDozMToxNSArMTAwMCBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2FuYi5hdXVnLm9yZy5hdT4g
d3JvdGU6Cj4+Cj4+IEFmdGVyIG1lcmdpbmcgdGhlIGRybS1taXNjIHRyZWUsIHRvZGF5J3MgbGlu
dXgtbmV4dCBidWlsZCAoaHRtbGRvY3MpCj4+IHByb2R1Y2VkIHRoaXMgd2FybmluZzoKPj4gCj4+
IGRyaXZlcnMvZ3B1L2RybS9kcm1fYnJpZGdlLmM6MTI0Mjogd2FybmluZzogRnVuY3Rpb24gcGFy
YW1ldGVyIG9yIHN0cnVjdCBtZW1iZXIgJ2Nvbm5lY3Rvcicgbm90IGRlc2NyaWJlZCBpbiAnZHJt
X2JyaWRnZV9kZXRlY3QnCj4+IAo+PiBJbnRyb2R1Y2VkIGJ5IGNvbW1pdAo+PiAKPj4gICA1ZDE1
NmE5YzNkNWUgKCJkcm0vYnJpZGdlOiBQYXNzIGRvd24gY29ubmVjdG9yIHRvIGRybSBicmlkZ2Ug
ZGV0ZWN0IGhvb2siKQo+Cj5JIGFtIHN0aWxsIHNlZWluZyB0aGF0IHdhcm5pbmcuICBUaGF0IGNv
bW1pdCBpcyBub3cgaW4gTGludXMnIHRyZWUuCgoKVGhlIGZpeCBpcyBoZXJl77yaCgpodHRwczov
L2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyNTA3MTYxMjU2MDIuMzE2NjU3My0xLWFuZHlz
aHJrQDE2My5jb20vCgpIb3BlIHRoYXQgYSBNYWludGFpbmVyIGNhbiByZXZpZXcgYW5kIGFwcGx5
IGl0LgoKCj4KPi0tIAo+Q2hlZXJzLAo+U3RlcGhlbiBSb3Rod2VsbAo=

