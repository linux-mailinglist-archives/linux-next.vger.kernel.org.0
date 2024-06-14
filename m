Return-Path: <linux-next+bounces-2553-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D047908644
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 10:26:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 716631C20DDF
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 08:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEB21185086;
	Fri, 14 Jun 2024 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="vzcBHhGo"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31B1836DE;
	Fri, 14 Jun 2024 08:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718353602; cv=none; b=AP9satXIkGGQkJ/sWwbkJS2nAovR9jTgPBaT7wd2V3vTi/eeaz2Gq9PpFN0KFdZ4OvJu402KphiysGZ4fw9H2iAWaD5BcTZmgzfowrtP2tr+q/IIiP+sdQprF3EAMHesM61vo0+n1XxCjkt0eXmuNUk/1PN5oH1DJwILFhgAlPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718353602; c=relaxed/simple;
	bh=EVLVy7Bv0eKj1jF9MLvl2HGYjxBbFl3CN6h5dhlRxuA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IglFfrQNutW9OvUPlUo6Qf/+Zko9+0o7TJOHjdL0pgYto0Jbhh3Xhg27Z0U9OSB4+5ZSnJWQW/NEfHp5A8MGhhZzanonZsNlQZ+TUoc6PVPlJVDJX3ZZVT9rHalshPnBbq6lDjyFguXsQW4qm9cMYRbkiHcqu45wVm/k9bFmUE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=vzcBHhGo; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718353585; x=1718958385; i=spasswolf@web.de;
	bh=nvt/PT0X64MQJX6QdoZMKtXoF+fBXSJXi6eEUXetj60=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=vzcBHhGoOtihQnGYTUn1X7d3pg4OxMpoFH5ghNZh9kSko6WT2mfko6obnNMK+jEP
	 D1/I7SicPMXHfDS14Nt13lUtZFHOKbzThrI28LY3PFd8iW3ICv7m3BORzd4BXNI91
	 T8zeE1fj7eWKVztGAKO82TsdVFhGV9KNybrd6h/S+DbTDmOtQv7JaQNhAc9TCQos8
	 LN/Dg/E4Rp1TguxE+ibFBfUQdkJroRyioI/2UDSPe5Fo1Nk9MNocvM+YoTBNjto9I
	 BCHIcNEiYY/wxz/rctzgzYVnaumsLhu98kBi5l6zraJYNs7Hn6+2Du6nYF4HK7TDG
	 koXHHv8Wxeh+5Eq0FA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M8T7E-1sMPya42PQ-00GK3s; Fri, 14
 Jun 2024 10:26:25 +0200
Message-ID: <f44ed73a49518a991003851e9075cb19eb9234a4.camel@web.de>
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
From: Bert Karwatzki <spasswolf@web.de>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Fri, 14 Jun 2024 10:26:23 +0200
In-Reply-To: <20240613170351.cc3e7ccfa1bb198b57f31352@linux-foundation.org>
References: <f4ea65e28ac47e6acb13f401f46a414a2f50f7bf.camel@web.de>
	 <20240613170351.cc3e7ccfa1bb198b57f31352@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.52.2-2 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EPyl6W19gihiSneiVpEsn+FcBJs9DgzxQG1UZUJOawZ8SuqYjOs
 0ziGoqa4dEpvfzsm71IbCnt6bCVMQtNYy0Er5jaEOv9CADziPuoGfLgjKFsRrcC+WO+/x4V
 eZ4VCkNNp2zzZi60sSEJHxiSUIDNNuRnjZaFEc8X2tJP92I2xdYIx9T6VqIoG3XSFqFXIVb
 HY0hSgDlVVry6HkbJg1Sg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:RXuww3oz1Sk=;RDKgfNgyouDmlEwivdZh2TF7Pm7
 NtfJUm987MgqCZHxmYW0oR0cMYnhIGvRbKWFZwXSf++wAYDGwfdtsbWPlmOPBv0MKTg50QxBW
 yI9feh74/JiXO2K1Wrx7ybUwIsopKb8QOT0vC1MZ9ttuMHXE7qApBCNjSFKJp0Ka3eMqRpYHe
 TByInT4//PWC9RWtZwf0wWYyGXN9DRFG8o0r+U2dbfJqJFyRJ7HFv+8mGtDP0xK+TAeSCl1RF
 wVFXjGmIBXHM4oKO+wU9jPKg9pFci0IYowSyaoBGfVKihlklSQWfDqGYgj4fU7QDI/7MiLUlX
 jKoNCs8LaK1kByWyHEIXOulXI0CADZZ9vnW//CA8yLZzdvBamtiAf4fDK+XAJQTyHNJ+A92zB
 lNDe9iiOHw15NDSkmgqxIR0/ivChFzKn/H+c1DSA8x2UMq2Q0FSB3xpwFNsLatOeUDvMXnkRr
 DCgJdBhvv8BlND/oPxQUxscWPYyF4G16IAJTtwWpcZkjSW3XYhV7Dw28UU/+OqU1XzLP3LDpI
 N7Bqt2rJGj6qEWJJx9bDTVW4X20j3ghmKTAbHviZDtDBJYaWxKa+6pM7x4PAwT0LkHCo5ETgh
 SX86/77eJBm7N84f2wJQMCwiGolIwwsIYfcvXsakhgYphXfqM9b9hjJ4pFH0oR98zCIU+tKFM
 FisFB1iqz2PgJJ2oSKwVurQwZRGRJ0S2YDHINfHn7FuZJn7s6JWPzGYensJUuW+q/aBAirNon
 6oUwmf/9XPD/ra7ZhJ5+n1x+z8w9D/bC7gT5/IdWNtYoLoSIXEALlTEzBk0OJM7Bx4AGvCnE1
 TPsEvaZQjJ6tL5EuYFxhYze1kjHDhxyiyPB3n79aLw2Uk=

Am Donnerstag, dem 13.06.2024 um 17:03 -0700 schrieb Andrew Morton:
> Let's hope Linus doesn't read this.=C2=A0 Why are we nuking the entire
> planet just because some counter went wonky?

It's not just the wonky counter, the error always comes with a segfault wh=
ich
causes a firefox tab to crash, though I've not yet figured out how this is
related to the BUG message or commit 1c29a32ce.

[  179.393488] [   T2278] show_signal_msg: 16 callbacks suppressed
[  179.393492] [   T2278] Privileged Cont[2278]: segfault at 22cddf91d3a0 =
ip
000022cde1aad010 sp 00007ffc616851a8 error 7 likely on CPU 15 (core 7, soc=
ket 0)
[  179.393504] [   T2278] Code: Unable to access opcode bytes at 0x22cde1a=
acfe6.
[  179.498173] [   T2289] BUG: Bad rss-counter state mm:00000000d0a3f682
type:MM_ANONPAGES val:1885

Bert Karwatzki


