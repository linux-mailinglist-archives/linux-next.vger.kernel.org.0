Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D089D268C
	for <lists+linux-next@lfdr.de>; Thu, 10 Oct 2019 11:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727280AbfJJJkD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Oct 2019 05:40:03 -0400
Received: from regular1.263xmail.com ([211.150.70.199]:39326 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726602AbfJJJkD (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Oct 2019 05:40:03 -0400
X-Greylist: delayed 416 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Oct 2019 05:40:02 EDT
Received: from localhost (unknown [192.168.167.225])
        by regular1.263xmail.com (Postfix) with ESMTP id C04F33FA;
        Thu, 10 Oct 2019 17:32:57 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [192.168.60.65] (unknown [103.29.142.67])
        by smtp.263.net (postfix) whith ESMTP id P30352T139712782128896S1570699970516291_;
        Thu, 10 Oct 2019 17:32:57 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <0bc8cce9b6576d0427695f1204c0bf3e>
X-RL-SENDER: kever.yang@rock-chips.com
X-SENDER: yk@rock-chips.com
X-LOGIN-NAME: kever.yang@rock-chips.com
X-FST-TO: linux-arm-kernel@lists.infradead.org
X-SENDER-IP: 103.29.142.67
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
Subject: Re: CPUfreq fail on rk3399-firefly
To:     Kevin Hilman <khilman@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     kernel-build-reports@lists.linaro.org,
        linux-rockchip@lists.infradead.org, linux-next@vger.kernel.org,
        =?UTF-8?B?5byg5pm0?= <elaine.zhang@rock-chips.com>,
        =?UTF-8?B?6Zer5a2d5Yab?= <andy.yan@rock-chips.com>,
        linux-arm-kernel@lists.infradead.org
References: <5d3057c8.1c69fb81.c6489.8ad2@mx.google.com>
 <20190718162005.GF5761@sirena.org.uk> <7hmugdynmk.fsf@baylibre.com>
 <2314814.WbdfqDVNqK@phil> <7hv9uq9wfe.fsf@baylibre.com>
 <c973d3fa-5f0d-c277-7c83-6227942a671a@rock-chips.com>
 <7hd0gvzuvw.fsf@baylibre.com> <7h8srjzuen.fsf@baylibre.com>
 <7hh84yisd3.fsf@baylibre.com>
From:   Kever Yang <kever.yang@rock-chips.com>
Message-ID: <3ed325e9-c958-c329-66b7-6eee8da06fde@rock-chips.com>
Date:   Thu, 10 Oct 2019 17:32:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7hh84yisd3.fsf@baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Kevin,

     I will send you a Firefly-rk3399 board to you.


Thanks,

- Kever

On 2019/9/27 上午6:51, Kevin Hilman wrote:
> This is now failing in the v5.2 stable tree.
>
> Any suggestions on what to do?  otherwise, I'll just need to disable
> this board.
>
> Or, if someone wants to donate a new rk3399-firefly for my lab, I'd be
> glad to try replacing it.
>
> Kevin


