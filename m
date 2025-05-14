Return-Path: <linux-next+bounces-6756-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E44AB6010
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 02:11:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C862464F66
	for <lists+linux-next@lfdr.de>; Wed, 14 May 2025 00:11:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614A21FDD;
	Wed, 14 May 2025 00:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="A4eu4F4u"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83EE31C27;
	Wed, 14 May 2025 00:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747181472; cv=none; b=qOzt6Uhx5VVJtAz0CvlkN0+h9/vE1hxhsiX8DPVDHuGiAVkSBgW5MMzbvHp3lThLIROUSrOmL3JVr6x7GFTcUhH6DRBjGVgJas71bdIwCIYQKYoleIlpLhtrENRiyFQk+D80II2Nqnqs+75vVFn81zGyXbxjM48UafqjxBtce5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747181472; c=relaxed/simple;
	bh=wkfDB2oVIWKK1a5eXkQoWzJ/nlBkrw3GK1U6oYBNAQ8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VCZtkzFjTmvISy3kUhFFOdFxfgCLwJaowPgenh3DRz8hvl9DVmJXtJCeJ/SFv2fX6XlgJBoSkABJ2WFV87NdAoEyEtxCPMPnkDEhn1JBbEqE1q5wB2GxOIqyHEUHXrnaIrey4YnlmpLVt72wit8pbdVLgw5d9PjNnKshldHscz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=A4eu4F4u; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1747181467; x=1747786267; i=spasswolf@web.de;
	bh=op1KZQkRCtc3+W3fATc0uPEXHj/b7P0Lr/rtvLPmTPU=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A4eu4F4u1O16nrMqsqe6e9WO88QQRZIF8yaEzmoXMWG0cwkW1NkO5udkFzRPXcZP
	 KDw0IutqvA5tyzcDgsWOo9b+lN71C4nVU+gB87NJN0QgUZ+gzWf0X0pYWEPsMU0Pe
	 /VDN6bNnbQt/p3tXIxgA6Ns+RngP2WbiCekhEa9IzzKkvald6klTq41tFe2DWLNB3
	 DVx56trOOk/Kl28CxJJoTciPclV28HCiS7avoiz6faZazmP2S8j6VVy6d1VgJbVvu
	 KdlaGCjlrgjckCemMe/5NjmnD2D7HIvP4luJdnhdD37TZifI1FNXTAAqPgkAbel01
	 HwY3/R//5IRd2Xf11g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjxeO-1uhTqV0nrE-00ndWS; Wed, 14
 May 2025 02:11:07 +0200
Message-ID: <7471a185adcc34a79c2ab8ce1e87ab922ae2232b.camel@web.de>
Subject: Re: lockup and kernel panic in linux-next-202505{09,12} when
 compiled with clang
From: Bert Karwatzki <spasswolf@web.de>
To: Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
Cc: linux-next@vger.kernel.org, llvm@lists.linux.dev, Johannes Berg
	 <johannes.berg@intel.com>, spasswolf@web.de
Date: Wed, 14 May 2025 02:11:05 +0200
In-Reply-To: <87h61ojg3g.ffs@tglx>
References: <20250513164807.51780-1-spasswolf@web.de> <87h61ojg3g.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oPtwMikyUfZ7uvY4o2qRU0Hn/RpJAD9cDevhup5xGQepFv6jujd
 k+K2uv5LgzgIuo6gF6NZcAQ1WGBoS9WAeGwRD9W+qPfc8y66foFFjsZF6OqdjKno1E1HKn5
 lO6AMZzZSqz0fym+JRnSG0e7YcZyS7ZQUQOARJg85gYolBBFcTtZjflgMOVu5/x48rxLUuY
 RKn6eauM58n8PZvNW1uyA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6H6/ew3cfHk=;Cc/dGYOQdL+WFhwqQKouJIiYS14
 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
 aT8tyxcrwvObM=

Am Mittwoch, dem 14.05.2025 um 00:33 +0200 schrieb Thomas Gleixner:
> On Tue, May 13 2025 at 18:48, Bert Karwatzki wrote:
> > >=20
> > > I'll now start a bisection where I revert 76a853f86c97 where possibl=
e in
> > > order to find the remaining bugs.
> >=20
> > The second bisection (from v6.15-rc6 to next-20250512) is finished now=
:
> >=20
> > This commit leads to lockups and kernel panics after
> > watching ~5-10min of a youtube video while compiling a kernel,
> > reverting it in next-20250512 is possible:
> > 76a853f86c97 ("wifi: free SKBTX_WIFI_STATUS skb tx_flags flag")
> > This commit leads to the boot failure, reverting leads to the
> > compile error it is supposed to fix:
> > 97f4b999e0c8 ("genirq: Use scoped_guard() to shut clang up")
>=20
> I really have a hard time to understand what you are trying to explain
> here. 'This commit leads..' is so unspecified that I can't make any
> sense of it.
>=20
> Also please make sure that you have commit b5fcb6898202 ("genirq: Ensure
> flags in lock guard is consistently initialized") in your tree when
> re-testing. That's fixing another subtle (AFAICT clang only) problem in
> the guard conversion. If it's not in next yet, you can just merge
>=20
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
>=20
> into next or wait for the next next integration.
>=20
> Thanks
>=20
>         tglx


I merged git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/cor=
e into
next-20250513 and this fixes the boot failure but the system still locks u=
p
after a few minutes (with flashing capslock). To solve this I need to reve=
rt=20
76a853f86c97 ("wifi: free SKBTX_WIFI_STATUS skb tx_flags flag")

Also commit 97f4b999e0c8 did not actually cause the boot failure that was =
a
bisection error.

Bert Karwatzki

