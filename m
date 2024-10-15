Return-Path: <linux-next+bounces-4269-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C63799E0B6
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 10:18:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95D061C20F2F
	for <lists+linux-next@lfdr.de>; Tue, 15 Oct 2024 08:18:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFE671C8774;
	Tue, 15 Oct 2024 08:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b="K9EIK2av"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3921C9B81;
	Tue, 15 Oct 2024 08:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980244; cv=none; b=RW2WmavLLi19nQx/WDfVYns/zTWSWGOoUY1Avi3pY/Catsr+8HxVKtPYG35Qj0erHmFrHhhL2DP8fSCb695xfeiQv+WTSLKF4mlg+B8t5HjiF98oLbV55j6sTjRj7GMuQDc2U2Q7KnWJ9myBcZBgkNGxaetzuw621yun2EApP9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980244; c=relaxed/simple;
	bh=R/IeZAKwaTvmee4fCSDVbeOW5LzJGMRTCA8XDNmd73Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gow0w4+bRAArE5D1XzkJW0PoNFkwwS1AG8PU1sR1cyDX4cKTXd4zE72lY739BtVGy0KQXxbTgF0fqkjG9K9L6Xk4ARhNrJVcqj/sUaGvmlR0rcKV2lsfAlZVZUt29j3oFwnQDcPaavRZokrxfhGNAWKq1XtyiNbwg/lcjaiaj/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=deller@gmx.de header.b=K9EIK2av; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1728980237; x=1729585037; i=deller@gmx.de;
	bh=R/IeZAKwaTvmee4fCSDVbeOW5LzJGMRTCA8XDNmd73Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=K9EIK2avcync2NGpa2KpL0wSeaxZLdNZMtsmQ4pgAhySSMsN7XD5NOui/EB6MT1i
	 UGCu/prBEDHa+DzID97kmUI1oJKcJT+pkUoAtjLoo2vuBM85nyRsciU4Om4aU9L5t
	 PYG89uXQTlzt+R8tLRdcr1/iidx5DRGwOgzROykQB5wm+nnj+Lm0/JyBesRtogA6/
	 ZH+z6v3382OY7nhsexD7L7K9iViQ/sSA5zl+Z2H90MHqFdvW+xLOqgFgj2CErBJx6
	 KPm2wW7j3cS98lcoztHJLdWRogIRE3BawVxmcz6oUrNAiWCwj2IYs8L2JIOX3hMLp
	 /GFFz2UYWzxueQ++wQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MuDbx-1tobcv4Bqf-00z9po; Tue, 15
 Oct 2024 10:17:17 +0200
Message-ID: <0d4f76d0-9b67-4956-bd13-ce694585a6fd@gmx.de>
Date: Tue, 15 Oct 2024 10:17:15 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: build failure after merge of the fbdev tree
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Gonzalo Silvalde Blanco <gonzalo.silvalde@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20241015120119.533e65e8@canb.auug.org.au>
 <7df614b3-4b6c-490a-b64b-ceabf7d2d290@suse.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <7df614b3-4b6c-490a-b64b-ceabf7d2d290@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:R4WMAmc/CfqirNbrWBoo+oxjn8TuXPevx2nE+R2HpCB6OdsVK+a
 HKbMhRvuXtoACAIozVGC/lCndH83Rtp6/dvvbxY9vHNXxBnPZlwuNUBgyOnsWdtTSTvYMp5
 4CKJYLX8LYsiF2YAMoNKttHpD+xB4GKO28fgFYI3maYeOu8ztgGnzMc8ZZuF0RoYnwqc1hk
 LFdu0nknclZUULNsgQNKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dykrvO4qZLE=;znImtFtMsCIlSgQj4OIhiO+6XjB
 pdF6EyJb2EOwoYgCalodVbpgLNNKQfzyPJguqVc/biwKBpy77QJrZ7wwcu/Uc1p/qqrgUN6St
 LNH6QXPQh/YRDw5dRi1Feago3aAkSvoi/7bSx7+nPk3nRE66x5iJ/SOc8ghpeqPbdMzg/1imU
 +jBXOe11s4QP5fH5e0mWozw2yqCSLoCpowoUWfO48quQwb34JMBynVi9OOvOC+GZEDXooQYGU
 FA2IGVrRRGZgYmrkANhX7auAAwzirZs8xFnx/N8GX0cZGIs8FOwZffvVs84mUX2qtpzX+3r5t
 3lfvcMnHx0/JziKSYfcXAHdXpvlo756tS8r7t2JDJcGGjqZ/sgwzTsNV/PtW0l/NucxQaeh8t
 y0/pQ6sDN6Y4JQ3MbnJ30xf1d6+yjDoWVWLKOqhnic+j9ILsSJ9+pNQTdJz4drhXikX7LJb5z
 wo0BwYPl2UyEZA3WICmra0FnBSoE2Gp9U6RMbvrGKgGGDhRSqvIDcHKN8ZwRB3XQUji02+cvH
 978VUJQIRVuai9xeLJjDDv4fQ66IdFVImgk4QrjT0KQWoLQO1I2DMHOqUZiskSfG8kex2d9FT
 tYm983zsm4xrGFmkO+SNGEz13hlXd81bVn9TVfo15JIHFZkC2Cr659POxG9CcFR283H5bQoHw
 NSb1tE0Baxpi3Z2TIfPZ8RiF2GsseKZdWwvnqOOALbmRNfn9xkAFnZHkzphq/N6QTBH4nNY9R
 Dcx9fte4odPQfLofVKOzF55KJWWZpXMkhxXNYly9rTkKXNfOrA+y2kcFlMX/R4ppba1QR5bz7
 1nU1jKxprae0K1OGo9t/ptmQ==

On 10/15/24 09:15, Thomas Zimmermann wrote:
> Hi
>
> Am 15.10.24 um 03:01 schrieb Stephen Rothwell:
>> Hi all,
>>
>> After merging the fbdev tree, today's linux-next build (x86_64
>> allmodconfig) failed like this:
>>
>> drivers/video/fbdev/sstfb.c: In function 'sstfb_probe':
>> drivers/video/fbdev/sstfb.c:1439:2: error: invalid preprocessing direct=
ive #fdef; did you mean #ifdef?
>> =C2=A0 1439 | #fdef CONFIG_FB_DEVICE
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 ^~~~
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 ifdef
>> drivers/video/fbdev/sstfb.c:1442:2: error: #endif without #if
>> =C2=A0 1442 | #endif
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 ^~~~~
>>
>> Caused by commit
>>
>> =C2=A0=C2=A0 7c0510bb3452 ("fbdev: sstfb: Make CONFIG_FB_DEVICE optiona=
l")
>>
>> I have used the fbdev tree from next-20241014 for today.
>
> Thanks for reporting. While it has my r-b, it wasn't supposed to be merg=
ed yet. I sent out a fix to address the remaining problems. See
>
> https://lore.kernel.org/linux-fbdev/20241015071029.25639-1-tzimmermann@s=
use.de/T/#u

Thanks Thomas and Stephen!

I've merged Thomas changes into one patch and pushed a new version.
The issue should be resolved now.

Helge

