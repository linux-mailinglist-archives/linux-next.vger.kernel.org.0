Return-Path: <linux-next+bounces-6364-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD05A98F56
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 17:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 048D11885773
	for <lists+linux-next@lfdr.de>; Wed, 23 Apr 2025 15:01:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EE28280CF1;
	Wed, 23 Apr 2025 14:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b="n9f/ec2h"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92CB628369C;
	Wed, 23 Apr 2025 14:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745420398; cv=none; b=P0ZYFTvnM1j7xckni1bXyL0PqmTexs4qAA1u4DbD2AMl04N+4Jf1XiJJVOH1q3pMt8nWyvQcAS9/FF49D47f2T6xFC3uGaSv7BextEVgwRL2XifN7/UYvI/GJEG2+jEyl02vZL3BYqqRHg+IuAS1d0OEHqG/Q0az3+YnyL6aYag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745420398; c=relaxed/simple;
	bh=1tcyPhbJPdXH5jUfL4LvtFWavCx+oqxq/Y3jvPLDTYI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jL7ndYb1ZAc99U2bJPl5TtCudyOq+TWiHj3IW5PMkYT5EaGHjmsk/+SzGYQ3LjjhBsd8q5H6A5PJDitNtWIUrITgO/MvGL503vH4GHNVhOCCfV9r51qBab/vQD6gNjIJ2aF8N9wC0GOY/YqXpijvrs10hnoB5OzxpPtj+4Ktv0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=spasswolf@web.de header.b=n9f/ec2h; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745420366; x=1746025166; i=spasswolf@web.de;
	bh=fdzHEJg0r5xSWPCbnov93lSbtyCqfWpFglCAWX1cda4=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=n9f/ec2hJTiV8U2yoN9r0Fw0wDIW+uHVvUts037K7y3/p4H9ci0xw/EwPy+KrG81
	 0m8jUh/jhFolAmIdIwcFKv1xRt64BXxaibgUSwmXr1lF7Glr+3OvlvRk0kfhnrOnZ
	 9R4dr6kQjt3vXNWB0TSreFRWs4THd66qESAvCwmziiQs3HjxjvqQvgpTYqW/rXISs
	 aYb+3E6b3rDTthaeURpdvVaKRLAEIfFyN76D6gI4nlOb9/I9mvubYSlOqFcyyfSKG
	 Km+sXkD35FCXUdK5Q7/SgChAdTbjWH6MXjDkamNxT4oG94cHXIbnQPhhnZf0lyXSQ
	 NzD8dja+1W2jgJBNZw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.0.101] ([95.223.134.88]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MPKB7-1uSKPr2TWv-00XAuO; Wed, 23
 Apr 2025 16:59:26 +0200
Message-ID: <fe8ff6a7943b8438de2daa237e20a940cb6a86e8.camel@web.de>
Subject: Re: commit dd4cf8c9e1f4 leads to failed boot
From: Bert Karwatzki <spasswolf@web.de>
To: paulmck@kernel.org, "Aithal, Srikanth" <sraithal@amd.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kuniyuki Iwashima	
 <kuniyu@amazon.com>, Mateusz Guzik <mjguzik@gmail.com>, Petr Mladek	
 <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, John Ogness	
 <john.ogness@linutronix.de>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 	linux-kernel@vger.kernel.org, Linux-Next Mailing List	
 <linux-next@vger.kernel.org>, spasswolf@web.de
Date: Wed, 23 Apr 2025 16:59:24 +0200
In-Reply-To: <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
References: <20250423115409.3425-1-spasswolf@web.de>
	 <647b9aa4-f46e-4009-a223-78bfc6cc6768@amd.com>
	 <fa8dd394-45c1-48d3-881c-5f3d5422df39@paulmck-laptop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oimsIrofTC/zUlTXWgBJOEf+drvgEllqQHbgKLebYssnPV4XtIA
 sVtvK9fJ7DSpHQKBPRGk7hJ4yXnmdUFta/QvkBC5fKID0bFI3Y2O3XrBfuLe9E5em2NDGbl
 CdrsVxe8mVXsHNiwbjkKIhmrn8qI2HtkA81I4TPi69FhmmwGRSTq/xnSxqR2tTD2X+2VMHH
 eo0IMWgGQLnFm67J88Ztg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:77Yb7i/SkjA=;qGUnuLMlTmwCm+RSe2Q7vvEIB7w
 fYrBLFmR0Tu0v1z9leESaJyFumWs5WiGFTno/fSe7fdsKndUTtpI9sw/PUMzuhm0bDmV8qGJ6
 pmsbLxtc0Oti/zgLVtjmVQAbZkh7PZm63eML8kzqENUKbMaT8C6GmJJT4cl3KHPSdL2wwrn1r
 t1+AX72M3B87X1+f23jwTfhvzTd1xgZ4v5qhoLFLNr1e9p8EI9IzjS4gA+7yXxbO7JACH/aZa
 aD3mtuXGg1uJDK0I77pCUmnNvwDWdv7ppPzjdAiRpH1Xzkt/lO1bIcVQ+W+HAMsYqw8JSU5p7
 P5A4TfbL7igSN32lrIItJAkcoLKnTlhKJXQBxTGNRBhvuRl36EYLiRfRsJ7IjhaMoZ3FObKei
 6AyHkI/yTd1+0DaviCd4qNsp3nxD6Bmfh/GsJGwc9FM9/1/mG/zt03wSWqQvBPcoTjfwrAoy1
 /QyLiIZlW/bjkCWbnX90+duIrfXbpZFYoiMxXm7iqP2uu0lQ0XOcl7WVprqttXPp8XgnU3FK1
 Y26Oq5XYGDMHfeNaAtPQtELLDWhYwRY7YOMp9Jp977fJoVuqZQFgbzDXCQdAzytr7XYY8g7KE
 Ijke6bEElyNP1Vn93NvCFwF29RtvzIw27N0SXbLcZZODQ9o5wIr4leIYnIBUTbGqEW10YhK0t
 7qy2yaXEhz/14ML/PUjGxMzK70/4fqVQCie5aOndK7RYenpY73XLvME26t7VZrj3vnVYG0+yA
 J3hpP8WGVq517c6HZyMP2wN1T7T3gI+GzKPO750N5UewGQCBC4TyBPfl6L5dLqzbl3LE+I7HJ
 Q1sAMJa804TQOR4AJJiYVpg9HQnhbUjCK2gmpRKwbLAdjxCKeks2vp7+sxJo/0/jaT1ZDcBqX
 CKWhWR3Yn7JPx+nGcgy6t+iTWBS5C/ikaiAQ76TbrkvMzk/u5rb8mKfz+z8vUqLDSOfVxsncx
 L1hka/tz6ubfWz5Nl7y2QrI3aeFiOxNomTtPgqnRsZE89L3hV9SOzcTitcLB1t0OuzwMos8Xt
 hs0DoRfemHnKTv8zD9ilK+w1P+ZfHp1KSs04sy4+4j3c0k0bs9be8urp4McggIUpz2AmVC9eM
 hNC+ygpdVd+VKKDok4TIJ8GRgrQ4P3iX/1+6KCz11amnovp0BxwGvJu58n67lwe8F6Iz8y7rE
 +CV6Gxs1sX0DfQywJwSQTMMAyDgnu375qSufikrcVS61IhkmWoNI5PFfLD0UXjuOxVts3Ms8R
 cC0tI450EM0naFPnYmBn6Gcdf4oX4no8BlPES6orphUb3SEYWyhHXM/n3bkeRFdkVRSW7WmsD
 MRcGZLZOyCWxHRL+P2KDHStsO6+plj4C4Y9atutzU1SPnqUoqLCHeSnKDD9Uy7XZ/FF6RbIjt
 OrwSW/MqhzA5wsvrvyMj6Ho9dw+q01naC6uU//iszDlfh7+bYuZWH+ovggfbX7d+uRbnb+Ols
 Js6arNktBBU8UFNphQiYxiCxtNsU9jnC87SnhxdPGcGCuBxWdJnL1kAqqaMSZa19zMJ9SIQkY
 dV3U1PcsCXmMQPUm7iWEJuCZGD+xTOlZdWAwnUkTqzykTBIl3JG4kHddFOtdBi4ZWqgN6f4UD
 KCZu5K9BuuHLwRCZtxR+fDAKIPLZRxbQ70WWK8XeKWnyo8qJ/fwoqqOPzMHBuUT9bqMlqybti
 FC7B9jrVFc6nkSvMpl4/ZRSPa2YlIXz+Q5SQOgvmonddUuv/vGe6wT9IrLoU5ewXl61T8BY3H
 NZ3D0Rxc9X7PB/dFf6iEh9ezuj4eSOruTPKcS/j5nfMmVUvBmbcbeFGMai+CvHRWf2exsg7Oj
 BgEID3CVsa/d8VE2fUhc8sxKiEAWLeouAxLgEvK8yaPSg/BuOmfr/EQFLR+TSXnk/74i5Xybe
 UL86VQDDAHovU7R5Agfhxar6jSphmy1xSxCW3A1hNsDNm+mWpJs0vOQ/FMazyvadB3Q6WvgPK
 a++aMr1jXvkZaM8PreGG8HEnAKaPw9M3ijESQ3j8uWVMNprOVZq/6xZZ8wYev6Ok7lOFBzrf4
 0dt4adJIjIXkZMdWPB0n3BZc43rvTGRqYrtIKueW97LlWk4+vTOtG3jvVn1wz0tn1bDOcOZVP
 m2P84epZJhl+BgoudE1uMkIEjOFv/73IVzyqaPgVCBb29aZqLwLB09pmdw8Xdrt4xTdnQGB+k
 RENh4t7KKYsuap2HJc07SYFVojOTCgvONS/7kEXkc4+TgPU7gp4nrwegiIE9CgkGkFvNjkUna
 IgY+5n8gpTiOInpppEK2evRGGZXgYoAiX5qV0k0VWVNq3YjkinDsar6c1gChYsVORF1LqzEf0
 L/Z4Mpumv4l0N1qs72iYfbytVTzQzQirAomgucuaPixiivLHOm72vIzAZQdhTJexXq6n1qYar
 FegPEeWPUGe6visHyISZDkRqOA6BqF6Dy7BJRcp31bbssyDUkA1f4nAT/2vuNzPWttSAS3wji
 NPs8CjlnPk9eaivqsTwMd+wMFGWSNTy8MecxKES/XFwbZph+PVS/POkptLStBwl2Kqv4/UyL1
 Gxlay6353F2354uJXuQAD/8FatIOwss/ey9fRfb9kOEZjWTvee4Yia7WBkbFT8lQgRLb97ugj
 Qh+aOSy5dUZPpZ51mJZfHkpyiBN9gsOG2BuokvrODTkitpIBKxEPRSRDHPV2iZ03tt0sNdPBu
 oY75KqsjVA7m8hbyhHQkMFTbGJjB3ZsguUP3gtUUuwwjweHr6PuGZbGCilDiKVdktW+Vi9xG3
 J+vBXrioAB3srU5a9GphI6ZPNRUQ8R1kgSemAcqsYJeRaVIn0/hoFpWKJFrv3ZsPLgz1SiPHx
 Y0RI5CGbaWHSboveSGda4Fs4RVKO1kiFIcysUShpjuBB5jIqZ1X4QZmtYNqMZKnC27jxXH5Nt
 JOtqzmZnruFJfhKfvov5BGI8wDW8F1A1VWpCXSUDS1GZQrLyG73S8AH1PykzueL54ah42wYpt
 mt2FzGGttxjdWac5tlTgW6CZHcoiY9AVbNsDi7ttO1gAl9hsjsSJ

Am Mittwoch, dem 23.04.2025 um 07:18 -0700 schrieb Paul E. McKenney:
> On Wed, Apr 23, 2025 at 07:09:42PM +0530, Aithal, Srikanth wrote:
> > On 4/23/2025 5:24 PM, Bert Karwatzki wrote:
> > > Since linux next-20250422 booting fails on my MSI Alpha 15 Laptop ru=
nnning
> > > debian sid. When booting kernel message appear on screen but no mess=
ages from
> > > init (systemd). There are also no logs written even thought emergenc=
y sync
> > > via magic sysrq works (a message is printed on screen), presumably b=
ecause
> > > / is not mounted. I bisected this (from 6.15-rc3 to next-20250422) a=
nd found
> > > commit dd4cf8c9e1f4 as the first bad commit.
> > > Reverting commit dd4cf8c9e1f4 in next-20250422 fixes the issue.
> >=20
> >=20
> > Hello,
> >=20
> > On AMD platform as well boot failed starting next-20250422, bisecting =
the
> > issue led me to same commit dd4cf8c9e1f4. I have attached kernel confi=
g and
> > logs.
>=20
> Thank you all for the bisection and the report!
>=20
> Please check out the predecessor of commit dd4cf8c9e1f4 ("ratelimit:
> Force re-initialization when rate-limiting re-enabled"):
>=20
> 13fa70e052dd ("ratelimit: Allow zero ->burst to disable ratelimiting")

The predecessor commit is 24ff89c63355 ("ratelimit: Allow zero ->burst to
disable ratelimiting") in linux-next.

>=20
> Then please apply the patch shown below, and let me know what happens?
> (Yes, I should have split that commit up...)
>=20
> 							Thanx, Paul
>=20
> ------------------------------------------------------------------------
>=20
> diff --git a/lib/ratelimit.c b/lib/ratelimit.c
> index 04f16b8e24575..13ed636642270 100644
> --- a/lib/ratelimit.c
> +++ b/lib/ratelimit.c
> @@ -35,7 +35,7 @@ int ___ratelimit(struct ratelimit_state *rs, const cha=
r *func)
>  	unsigned long flags;
>  	int ret;
> =20
> -	if (!interval || !burst)
> +	if (interval <=3D 0 || burst <=3D 0)
>  		return 1;
> =20
>  	/*

The patch applied on top of 24ff89c63355 ("ratelimit: Allow zero ->burst t=
o
disable ratelimiting") works fine.

Bert Karwatzki

