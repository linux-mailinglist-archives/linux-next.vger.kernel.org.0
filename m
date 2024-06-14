Return-Path: <linux-next+bounces-2554-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7C0908675
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 10:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 764E9B231CB
	for <lists+linux-next@lfdr.de>; Fri, 14 Jun 2024 08:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB1719006F;
	Fri, 14 Jun 2024 08:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="tTgNOnuY"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05BC190066;
	Fri, 14 Jun 2024 08:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718354286; cv=none; b=qOvnkT1PtTsRwAzp9OjAqsiPlehnp4gIXP/T97L3TUMvO2HgJvje6XyBmuyTwYCnmIS7AbLle/MYG51ySl4fRsEsiXPKBwuB243ADrdHU5/hHzdctIPZ62MmEDNyGpk0GAARpnPAyyhDTOnZozZn6pWMdZHGfgnkjPxx932jJPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718354286; c=relaxed/simple;
	bh=ivcQjGPwDsRL7TjnjALyJ+4Yl01a48suFxsWagd9HTs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WBoD8T0i6OP3jlgPs775bz8XcjkwdYI6GbnihpSK9CDgR/WHA/7GZzcZiPcq/IjQC0dkSyRySgYMIuNa0LbG5Zl17sWtVxZdIJUcfpX1sOO1SDfbK13OuIWhMoA68xKlY124F0lQHivlAV5mkO6NO9W+GmgKKXm96DvllXPn6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=tTgNOnuY; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718354268; x=1718959068; i=spasswolf@web.de;
	bh=J2MGAZdIrgD9+Bzu7JaNXHJzpLQMTsnyYBIuffMdmcg=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:Reply-To:To:Cc:Date:
	 In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=tTgNOnuY/3VeNmyH6sgKjfnby59kCnHstjO295eoL0ONf4BARwWYgjH9TzEx1EHp
	 wvbepV0+SltAy5vol6tFW78AoZ7m7jMiu1DsIeO/4Umaz2HsMQM+qzv92SIJOTjYB
	 InMCPsDTdiQZ7n19DIyjFJopORdRFeB38aTpTZhc1TtqSb2bK7Rgr1qq4TglLViNR
	 CPBxTn5r2c9XbXFcoJb5YgPJgQWnM+dFBMr0qxEhWFV+6OHwxjAVivlY74ch1F3kY
	 mW9SAS76XJYi1hzwKjpcRwZluETtW1G9wtTT2ZU5XKQlycbw949f5TBE3cm4EW53N
	 66fzmsFUU6Jhzj9l1g==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([84.119.92.193]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mx0N5-1sctZX2HF5-0149fu; Fri, 14
 Jun 2024 10:37:48 +0200
Message-ID: <e18bac6a57a4a45260e7282a70173fa6226955bc.camel@web.de>
Subject: Re: commit 1c29a32ce65f4cd0f1c causes Bad rss-counter state and
 firefox-esr crash in linux-next-20240613
From: Bert Karwatzki <spasswolf@web.de>
Reply-To: 20240613170351.cc3e7ccfa1bb198b57f31352@linux-foundation.org
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
Date: Fri, 14 Jun 2024 10:37:48 +0200
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
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:mWMPKDUBfStEkePPwT5f6bujc2xmxGr7EJ1wcXZs4QQMK9Z4MoH
 vcJym9ih6ks5ieaFZXNNJ53lo3r+Q3SYt5EdHgoT0H62YF/aYgx/qycDUDCEYED/UaOA4DQ
 i7e+qjpTiO6UYMPeApp7NtwcWSWFji2j6LVi1MN3FOwhQlH8wOwSgQUnpvxn7Qt97pF/Rii
 GtsDg1UkOB1DIos8OMYAw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:sdtRHhsobkg=;/Qnt+Ms2qsdIGjv5ehDrLNShe4I
 N+AFcFsQkKTJHFZ7WiExMxA1TNNSnl3Y/LWUqV8y3hmbRAXNTYIyR/X9sAfpYiHMpPGxu72Qu
 C8Z1AFizngbn49PE3pbsMm9KTwMq6TB8hgTPVxSZCUuRo4ZKoffbuDVOdDK2Fc+/6CMFwx4fq
 o9JADdq/v1WRkAV4F35aCdZyRHk2aZfLl3pQbMxytobKLANwoQo9PVfJBVGKr1him+U4LyrYN
 0GpznwqXIjjw39VW21y/Yc9MI/XO3lYF6AdBHJ9mZlBdqyB1bqUDLFPWIriBsXCwl2pybbjf4
 XHI+CTaxNwuTqA7T5XnQklovUXFSBObFN4j/0kYvRw8Dtc0hArsvRaV0Wn730c6AfzKrEhUx9
 XtmS7gZ2V6hkhh9fgPKxugzCnO1UX5amgTwRp7bG01Clsf8u0wa9YAgCucz0tTOtoWBqqCCVF
 JQmCnPUSHF01TUFtwhk56T+Zj9wmNypBrJ5Ft1YNbS0NszjgZFftBuZ+w3K4L21rkm6AjEYXC
 eLJhda/EFgFsR7icGy7Xs93tyP5C64JZstMVsKr7Y5Wn80Gf6dGzScMe2pk8MwTMc6sM9Aidw
 aU4APhNaK3AVVTX7gTTfqjE7IHG8JBV+UibNVT7pNemiWb5yQPoMEkQBtKQZ9yQ43wlb99qT2
 JmNa87iD2Hk8YR69CL0h9Jn6X0ofverAHUXfkSCeBq1pUJwBpRXR1OisdMFuhFItPovOlwz2G
 LKMiGj3qVnbfJHUr1rIpu9WxKGSqLNsKtFqwDwKL7TaVQG8KRqY2lNNqn0I5g7/7u8WG5ab8+
 l1OhfOicoqrAU0X5ct0NSt64TXhhfKMhTGyA9tLnaGMJA=

Am Donnerstag, dem 13.06.2024 um 17:03 -0700 schrieb Andrew Morton:
> Let's hope Linus doesn't read this.  Why are we nuking the entire
> planet just because some counter went wonky?

It's not just the wonky counter, the error always comes with a segfault which
causes a firefox tab to crash, though I've not yet figured out how this is
related to the BUG message or commit 1c29a32ce.

[  179.393488] [   T2278] show_signal_msg: 16 callbacks suppressed
[  179.393492] [   T2278] Privileged Cont[2278]: segfault at 22cddf91d3a0 ip
000022cde1aad010 sp 00007ffc616851a8 error 7 likely on CPU 15 (core 7, socket 0)
[  179.393504] [   T2278] Code: Unable to access opcode bytes at 0x22cde1aacfe6.
[  179.498173] [   T2289] BUG: Bad rss-counter state mm:00000000d0a3f682
type:MM_ANONPAGES val:1885

Bert Karwatzki

