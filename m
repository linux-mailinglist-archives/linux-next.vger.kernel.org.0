Return-Path: <linux-next+bounces-5118-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BC9A074FC
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 12:44:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 150A9168601
	for <lists+linux-next@lfdr.de>; Thu,  9 Jan 2025 11:44:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 994D9216616;
	Thu,  9 Jan 2025 11:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="RB0A0WLB"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 704D4204C06;
	Thu,  9 Jan 2025 11:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736423052; cv=none; b=nZw0Qg7ZVPufAX6HUkfoc+C4JQIvJWizCdklkGPDEqsiS8BvrdvgBYmhDdo7n7kTgzOVpTsd0WtGJp2a9cVB1kvm9rIc/xGHlRXmXYtSV/RqxRFozssE0XYYCm73ENT2lO9wAlNl0o1VLVf7PwuLc74GUdxw8BeajzMC5UOjPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736423052; c=relaxed/simple;
	bh=RHzPey8D3sueyLQMpeB/44gm/pVfyJPmGKjXNcI3v3U=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=MEcfrA1FZluBYmo+wNB0mkPsBrdVJl0Hydbw7KcKVdTRKXWVDwRWUSp7xWDeMe4chxM96Hfz4M+W2FoLw6tWUNBFbgiq7CTaa2df0COg/v3xR8+uS2dTMDyea93Mg1W8RplXzcX5ZhiPW25XjMoBrPPRW4Iu/uNvZwqU0snHpyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=RB0A0WLB; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1736423037; x=1737027837; i=frank-w@public-files.de;
	bh=v/hgDjYtUo60uKNKp6qJGDi7Zf4Ydg62dvs+sLzBwsE=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RB0A0WLBqF0trZX2R74NEavL66JBzysXOyd+EU+U5Uv6dAcGEj3YRCP9WNGkYmGC
	 uLT3SSQMUmDNcViUZlscR3V0xvUt6BOZCRMLjThHftmRWYBK7aMcM8N1uS1jzCWci
	 3UDaGgxeYWIoAkYja+Ie7SnOxDPDh3J6GoBCatFHeDd+cAVjlyYgGbmGpcRy5TmGw
	 C2VEBRKzkZKMKtc0Usrhu88GXEjBZHvECeXldndbzruQKqWwIskjtZhqqI0cEaYPB
	 JvndoQUIuugx7wjgOGnxcp5fy7OErrL67HEcN7VpXUzvnCnKAe7cq0IO9O5cOnPnn
	 zHcfHZcqRwfucmZSSA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.68.236]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MaJ81-1szh4C0vy9-00J8KA; Thu, 09
 Jan 2025 12:43:57 +0100
Date: Thu, 09 Jan 2025 12:27:28 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Linus Walleij <linus.walleij@linaro.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>
CC: Daniel Golle <daniel@makrotopia.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the pinctrl tree
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <CACRpkdZuo-GX+3xjpbLZsDUddEBbKVpfReH=+Ce=470bQ55BgA@mail.gmail.com>
References: <20250106164630.4447cd0d@canb.auug.org.au> <20250109084737.574cfb99@canb.auug.org.au> <CACRpkdZuo-GX+3xjpbLZsDUddEBbKVpfReH=+Ce=470bQ55BgA@mail.gmail.com>
Message-ID: <A4F63773-E0C7-408F-B6FA-0B448D934804@public-files.de>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:inprEt2zYHy620LjAXhNhAf2c91MZhELTNqEGPXoRi09MoTxiDr
 dsCIA3gS3BYkkTE2/8bfiQZ5ikf5XoSt4SK7wdAiL2mpiK7J+S5Yw7mTf4nvddjVEstzFsI
 Jbl96BPAUdAsE0gNB0i1JRufRqKG85bhFMkxouZbwMexM2dxoslc0UbrM4pMt9Ew784RYQy
 oQZ3rP7mlk1wQSzoVrEcA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:AkGv97eYg3w=;oYePxZDqs7KqaDzx1+riPFDumCC
 lgr3X1bJv98EKJts6TnWcPlnn8LV3Oeh7cvFxzEfBnL4KBwbl9IQFslV/otNDr8Ib6wV1mHNT
 1DBZOCcra4rTjwRLyTaxQw6250JLizTRW7rI7ocJ3sHvebamo1A0wEz0UOcwmRZN1ZzIg9fed
 FZ2UAQ1C2SpQg9MCksCzyJUTryqekVojfP0NLKnguRtgeJY4vNcTgznm6vPUtw5/zphj1ekL3
 6JNf+yJOFZCMMe7CgkBbTADiRLPKoWK7H+ynHkQdr5bkxUkEc1J7w02wzw3vMy8RZhCHI+JTt
 H0VSl79zTbVu0nkXNYw+8WQTTfO3OzdcAGc/3gyB9952ibGPCPdiHq6vL+UhPJvTpqFrrxHbH
 hvzo4R57NF2ZO7CPqXZI/OQBAvQzfenEiHB+MCS9Znk6HLoZ6AWVghlf/LXtP9iEFxX3i71jL
 flP5wx9U4soZEYOf4ktoRbAy/n9f+sQOaoPgwW8PfFg+2G6d+SDTmMdhwA4xZFEhg5xf58wgC
 gigk3FgXNlgBJeF6wYzGjD4Gkrufdj4W1oLLj8NWV1CBlfsKS+ubjdJic6x4zXavDGL/F40Q5
 hpX9Z4Q90vAQd6feJgwbzU320DTELysra4iYo+GADIa6sJ0IERK0+pr3vgJNAQPvMem17EcoR
 DsPdYEST+qAQMc5KdNKyzD4xqQjx2Zx5rkr2Rpt1Du02mMH187NDA0NfkN4vMn+Phx0LGajSc
 aJpFebUAKBpu4xGBC03Aw0kWSoQfivKNUGIxEpR6b8+/aPJRWyMmicGPiFtNA23UkWidtiLbe
 jygjXXW8ocRm42/S1gKHYlzqlB77crTU2mM+7XNkc1aMMv6nqnNdLasGg0VJsvp6wAhtPwl/Z
 kiHDQeAxBdz3UfCc0RRacr9JDfwlM7S4qyxexXRLtDOA2DyVvsSjV+jtevX0YsA66NrV4B8MH
 sLDP8eqIVxgYy3lcIOxfRNSbwAouQJEJDWjKg4iPSBmE0PUr06W6njwBPnnbCSd8VmnKQ3reH
 IsNVQSE65oxQjTqhk0mPP9E0Q5zhyiBhGBUKOnO0kTzVEmTvDBAOcVB8VYnmBVngP0f5ezLTY
 qYdu5HHaxMoIPBQkxTy/zur1diis6E

Am 8=2E Januar 2025 22:58:01 MEZ schrieb Linus Walleij <linus=2Ewalleij@lin=
aro=2Eorg>:
>On Wed, Jan 8, 2025 at 10:47=E2=80=AFPM Stephen Rothwell <sfr@canb=2Eauug=
=2Eorg=2Eau> wrote:
>> On Mon, 6 Jan 2025 16:46:30 +1100 Stephen Rothwell <sfr@canb=2Eauug=2Eo=
rg=2Eau> wrote:
>> >
>> > After merging the pinctrl tree, today's linux-next build (x86_64
>> > allmodconfig) failed like this:
>> >
>> > drivers/pinctrl/mediatek/pinctrl-mtk-common-v2=2Ec: In function 'mtk_=
pinconf_bias_set_pd':
>> > drivers/pinctrl/mediatek/pinctrl-mtk-common-v2=2Ec:606:13: error: unu=
sed variable 'err' [-Werror=3Dunused-variable]
>> >   606 |         int err, pd;
>> >       |             ^~~
>> > drivers/pinctrl/mediatek/pinctrl-mtk-common-v2=2Ec: At top level:
>> > drivers/pinctrl/mediatek/pinctrl-mtk-common-v2=2Ec:602:12: error: 'mt=
k_pinconf_bias_set_pd' defined but not used [-Werror=3Dunused-function]
>> >   602 | static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
>> >       |            ^~~~~~~~~~~~~~~~~~~~~~~
>> > cc1: all warnings being treated as errors
>> >
>> > Caused by commit
>> >
>> >   1673d720b7e2 ("pinctrl: mediatek: add support for MTK_PULL_PD_TYPE"=
)
>> >
>> > I have used the pinctrl tree from next-20241220 for today=2E
>>
>> I am still seeing these errors=2E
>
>Sorry for not attending to it earlier=2E
>
>I fixed this up by just adding a patch deleting the unused
>mtk_pinconf_bias_set_pd() function=2E That should do it=2E
>
>Thanks Stephen!
>
>Yours,
>Linus Walleij

Hi,

Sorry, that was my mistake while changing daniels code to use mtk_pinconf_=
bias_set_pu_pd instead of this function based on angelos review=2E I forgot=
 to drop this unused function (and did not notice it before sending last ve=
rsion)=2E

Thank you Linus for providing the fix=2E
regards Frank

