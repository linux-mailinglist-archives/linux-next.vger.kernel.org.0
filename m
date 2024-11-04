Return-Path: <linux-next+bounces-4611-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 062439BBE18
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 20:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8E4C1F22980
	for <lists+linux-next@lfdr.de>; Mon,  4 Nov 2024 19:37:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE8321CBE9E;
	Mon,  4 Nov 2024 19:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="Hq94fEEw"
X-Original-To: linux-next@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFFA1C876D;
	Mon,  4 Nov 2024 19:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730749063; cv=none; b=RHhg9kJB8LKsfMZLP9PyDWvcxw6G1sky2zb1x0dLT0CCIxJjm5OXYu/7WYaDr7OaO9qYImy+2uI4VyytgI7YIDxoI95ZCpKdx0XtV7vttF7/iwzH6//FRm6FY91T3LgdGSj04X5lGc9mziVdAp499++7LGI0LmJnZk/3cYPyZrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730749063; c=relaxed/simple;
	bh=/JXW2R0LchTZmcQ88Qn1IKszBGN9/UOK3xrZwi1QnxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CQ2zZ0PUYDL2WZkH50WO8cwyVhIyc77XXk4aE4uGo4qXk/6a6x+s5kpjSstNwYBfqNrKbIwE0deM1TUDISwtzfsUjfAC6kVwU6yDx0hF/SEptgm7uXpjCcvfmnRfe+Rrmr3Gum8qkUwLSODFfMmoeWGynWyZGQuK1PEvQ2LFbBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=Hq94fEEw; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730749047; x=1731353847; i=wahrenst@gmx.net;
	bh=HHRJUUe4qBU3jMnR/014D6ykMod61nDwsGapWt+8eV8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Hq94fEEwOp2b+g18twxwSd1BXAVnk0g5Kf/7PLMX325lojcA1FKhQsPudl5O2FYU
	 56WSopfFIfL613fT/mEi1Wk5krRJY7R5WJ4/QqQCv/Oy6dC+mEhaalDzJF973ebq4
	 MzTmywK1o+z6Y2vL80jasoQWQX15xoBwdtzYfobOibtNObVhG+7GoH65oy8ZhbNZD
	 XJCmh73xFlPM9gacD3xzKNpt0JeLfPFzUrF5c0laQo26+YTUWY4yYU09C/eEFABds
	 Z5azlSqyiQ/i6cgY1cg+x0+nLApWYPm1Kyr3x7id4KXx4pjITtuCV4z20VQC3hFBf
	 0dyuntjDb2/CxgsAvw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M5wLZ-1tAXrJ3vYJ-002Bap; Mon, 04
 Nov 2024 20:37:27 +0100
Message-ID: <e42a6573-fc0d-4a12-9895-09c1889fc759@gmx.net>
Date: Mon, 4 Nov 2024 20:37:25 +0100
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] mmc: pwrseq_simple: Handle !RESET_CONTROLLER properly
To: Mark Brown <broonie@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Catalin Popescu <catalin.popescu@leica-geosystems.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Marco Felsch <m.felsch@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-next@vger.kernel.org,
 regressions@lists.linux.dev
References: <20241102134522.333047-1-wahrenst@gmx.net>
 <20241104093901.rb5ozxt7qkdgoatc@pengutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241104093901.rb5ozxt7qkdgoatc@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3QUeJFnW8IfUDzUNR3gHgR1GLzSJwBr2VWJeYALXvvQo2Dx3pKc
 R/3ZgYDtC+toB/++6G0GvS/CXbk0ckOVkqertfY4jQYMXzN69VurWjmsBcPrfvcE6OVphnM
 gpHlZ0zTROZGsN0flINwOO6bdY7NAA8P1RGBwO52pds9HQ5WwQSFp1P9Y8R/JjPMl5QX4z6
 +2IIj9CzENqrj9jnJiSWQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:h5KB0udMUDs=;AI4WhMe78Bj/ADR/ZjjqpSQXFYu
 TVpk8jdDCDyDs2eavH9OmRT9BOMyWmtKz5+fu4jGuNfVg1O8vvj3O1nn99I0d5wj+plKAfHTW
 ulONPu1XpBkrgeRdtlUvOKx8cR1R+EFggHUouFfdcIJrRSxgs3btp5vsWTYoQouir+BkyCujN
 zwtSD+Cv1MqitaOXJ+XsJN1LgCUvlSXO3Xw39PE4tSgdpd2gtxa2AY+Q7Mp6RA1TzDD7HFDcR
 Z00L9Cw3mL/uxBezrMAyAjx/f3DrhmovYZK8gnw3dVgdAv6auRut3gCilZq7YNue12Bw8zwCb
 MOZYhCo2RA0MKy/0KRFm3I78OM8SCfIw7v+3fFfsXWTIAhY9gJ4p6wQs2T262ohRjnPwD1tjJ
 RuP5o+RzsQcP13csIbkQPDzXaInyrqIDPsLjcXiojinbrIUEdEM8vim+x7ZRrBg22YXeKSxNl
 WN927O8oR5QIwQXzEDRIsJ5S5aaXnegykPwBR270z+z15aFtKy2H6qWHf7CvYXFSFYUpVIlCK
 wFNW9H3+R5Emwo2e5Lb4PZgGhx+qhkkd4crxdWsQ5/Ys9iXOHrgn/aKG0xn0xi/QaZb7hvdU5
 nYE4XCgMY34NL8F3+jOWg6fVPRoaNuJN6cvkbkbhxl/8FvpS+H9YSdTUmq+DPveyOXzZr5fws
 LNPTG4rvBLjz90dqufEqHAglEbLWplhOcxek0sDuGmHMbmuC5V0hXFgI0JdLNAmARDsb76czm
 ytXa7vs5bYMcRSS9K1SKn6sgGzS+yRa1Ro2dy0vd/fJeWCcc4BMEldW2R3g1q+ZyHzXePwwMo
 sibno5DLHfnVfd/b7mm3W42A==

Hi Mark,

Am 04.11.24 um 10:39 schrieb Marco Felsch:
> Hi Stefan,
>
> On 24-11-02, Stefan Wahren wrote:
>> The recent introduction of reset control in pwrseq_simple introduced
>> a regression for platforms without RESET_CONTROLLER support, because
> This is what I was afraid of :/
>
>> devm_reset_control_get_optional_shared() would return NULL and make all
>> resets no-ops. Instead of enforcing this dependency rely on this behavi=
or
>> to determine reset support. As a benefit we can get the rid of the
>> use_reset flag.
>>
>> Fixes: 73bf4b7381f7 ("mmc: pwrseq_simple: add support for one reset con=
trol")
>> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
>> ---
>>   drivers/mmc/core/pwrseq_simple.c | 16 +++++++---------
>>   1 file changed, 7 insertions(+), 9 deletions(-)
>>
>> Hi,
>> will trying to reproduce the Rpi 4 regression from here [1], I found
>> the issue above. I'm pretty sure the Rpi 4 regression is caused by the =
same
>> commit. Unfortunately I wasn't able to reproduce it.
>>
>> [1] - https://lore.kernel.org/linux-next/6724d7d5.170a0220.1281e9.910a@=
mx.google.com/T/#u
I think i've a better unterstanding of the regression in your case. I
noticed on my Raspberry Pi 3 B+ that this change in combination with
arm64/defconfig causes a huge delay until wifi is probed (~ 32 seconds).
Maybe this is caused by the fact that RESET_GPIO is build as a module,
while PWRSEQ_SIMPLE is builtin. But this doesn't explain why the driver
seem to never probe in your case.

Regards

