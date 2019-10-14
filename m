Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A050BD65D7
	for <lists+linux-next@lfdr.de>; Mon, 14 Oct 2019 17:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733252AbfJNPFU (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Oct 2019 11:05:20 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:50744 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733175AbfJNPFU (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Oct 2019 11:05:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=xxyuYMJ5N1tFd70vGArrNKSdsXlWoKRjvdjD10n1+ns=; b=lH5qm/6PXVohUN61RKa1g7VIX
        nfJzXgYUgdAs78HXWOt2hutXvipXsDt+BiCxsgUpK8iruJvCwNAmD6np21Wm3dfXqnbAfZ8qltXHE
        8qlkFsYV66Ja1ermCHUe/W4318Ub2JhUstX9u+C7+gk8o5/IetBupAOULaBTttubS1o8YgvAUjaqS
        TlJdUQicFOg41rfnMeZDNzI7F9T7nCD1y5ycaRL7t/ZdV0y2ThNWnX3Oqpf3ldAbntvmYK/bOvCA9
        sf4dCDIZpM09FVpJ77DXJwzgqp06wiVClyI8akHVi5nBHlcbj9LKxxGCmP5X1FsmeDFOeBHwmtTrF
        jGovrYimQ==;
Received: from [2601:1c0:6280:3f0::9ef4]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1iK1uQ-000873-Df; Mon, 14 Oct 2019 15:05:18 +0000
Subject: Re: linux-next: Tree for Oct 14 (sound/soc/sof/)
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        moderated for non-subscribers <alsa-devel@alsa-project.org>
References: <20191014174707.469f596f@canb.auug.org.au>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6e2a049a-c5ac-3294-0dd4-7a10b972586a@infradead.org>
Date:   Mon, 14 Oct 2019 08:05:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014174707.469f596f@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/13/19 11:47 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20191011:
> 

on i386:

ld: sound/soc/sof/control.o: in function `snd_sof_switch_put':
control.c:(.text+0x49a): undefined reference to `ledtrig_audio_set'
ld: control.c:(.text+0x4d1): undefined reference to `ledtrig_audio_set'

when
CONFIG_LEDS_TRIGGER_AUDIO=m
CONFIG_SND_SOC_SOF=y

This code in <linux/leds.h> does not handle the config combo above:

#if IS_ENABLED(CONFIG_LEDS_TRIGGER_AUDIO)
enum led_brightness ledtrig_audio_get(enum led_audio type);
void ledtrig_audio_set(enum led_audio type, enum led_brightness state);
#else
static inline enum led_brightness ledtrig_audio_get(enum led_audio type)
{
	return LED_OFF;
}
static inline void ledtrig_audio_set(enum led_audio type,
				     enum led_brightness state)
{
}
#endif


-- 
~Randy
