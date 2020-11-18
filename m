Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC3112B7F5D
	for <lists+linux-next@lfdr.de>; Wed, 18 Nov 2020 15:28:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726019AbgKRO0S (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 18 Nov 2020 09:26:18 -0500
Received: from bhuna.collabora.co.uk ([46.235.227.227]:34932 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgKRO0R (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 18 Nov 2020 09:26:17 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: koike)
        with ESMTPSA id 62E5F1F411B3
Subject: Re: linux-next: build warnings after merge of the v4l-dvb tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacob Chen <jacob2.chen@rock-chips.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Collabora Kernel ML <kernel@collabora.com>
References: <20201118163229.1cda4547@canb.auug.org.au>
From:   Helen Koike <helen.koike@collabora.com>
Message-ID: <0dfef3a5-dc8c-a892-866f-a509e3c12f45@collabora.com>
Date:   Wed, 18 Nov 2020 11:26:10 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201118163229.1cda4547@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 11/18/20 2:32 AM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the v4l-dvb tree, today's linux-next build (htmldocs)
> produced these warnings:
> 
> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-meta-fmt-rk-isp1-params (if the link has no caption the label must precede a section header)
> Documentation/output/videodev2.h.rst:6: WARNING: undefined label: v4l2-meta-fmt-rk-isp1-stat-3a (if the link has no caption the label must precede a section header)
> 
> Introduced by commit
> 
>   df22026aebd8 ("media: videodev2.h, v4l2-ioctl: add rkisp1 meta buffer format")
> 

Thanks for catching this, fix sent:

    https://patchwork.linuxtv.org/project/linux-media/patch/20201118142400.3540109-1-helen.koike@collabora.com/

Regards,
Helen
