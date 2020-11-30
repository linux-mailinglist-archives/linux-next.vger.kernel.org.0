Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B5652C878A
	for <lists+linux-next@lfdr.de>; Mon, 30 Nov 2020 16:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725899AbgK3PQn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 30 Nov 2020 10:16:43 -0500
Received: from gproxy3-pub.mail.unifiedlayer.com ([69.89.30.42]:60696 "EHLO
        gproxy3-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725859AbgK3PQn (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Mon, 30 Nov 2020 10:16:43 -0500
X-Greylist: delayed 1329 seconds by postgrey-1.27 at vger.kernel.org; Mon, 30 Nov 2020 10:16:42 EST
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy3.mail.unifiedlayer.com (Postfix) with ESMTP id 4B00C4009D
        for <linux-next@vger.kernel.org>; Mon, 30 Nov 2020 07:53:52 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id jkYpkfMOldCH5jkYqkjokf; Mon, 30 Nov 2020 07:53:52 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=cYj8UELM c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=rOUgymgbAAAA:8
 a=W6bdkaRiws6l8-SGZZ0A:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=MP9ZtiD8KjrkvI0BhSjB:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=v7IvH1zP4Bp0P6MLFg9gRFUu08rG6PGxSswgIye38NU=; b=R5liyGLf32mvIgVSXVsKdleGFs
        9FkMW11YmjItYO48gswtUwaiNQtFFArq+gzDFeRQSMXW3+GnBwJKVt8VBu9RPriT137deA1eMi3zx
        LARxcY9rekEXXOnBZNexoni+sh0EDko/yqDkyeK+62hgitNm3QDmEB3CuyiCJpv93Hd2ggoS4oDlY
        NU1/kip9yUe+3+6EKrGZMUiZTdLB3eZ80I5mt74If0nvPnz09x7pEsEuD3JGaVwRMa+lx/Jk9rUz+
        ROL2OtAtc6/OMzW3L5yQwaLklXj3rHuSLYAf6HlTb1dJQl6+J8PFzgpJ+q+3Hq8A3tDDjzLv/KHgg
        z/g+e5jw==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:55702 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kjkYp-0032xF-Cr; Mon, 30 Nov 2020 14:53:51 +0000
Date:   Mon, 30 Nov 2020 06:53:50 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the hwmon-staging tree
Message-ID: <20201130145350.GA17038@roeck-us.net>
References: <20201130115603.48e91a19@canb.auug.org.au>
 <CAM9ZRVsq_VwYpuW70V7Dnfmqc7WXYcwsirGOo94B03Lp0uGyPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9ZRVsq_VwYpuW70V7Dnfmqc7WXYcwsirGOo94B03Lp0uGyPQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kjkYp-0032xF-Cr
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:55702
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 7
X-Org:  HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Nov 30, 2020 at 01:14:03AM +0000, Paul Barker wrote:
> On Mon, 30 Nov 2020 at 00:56, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> >
> > Hi all,
> >
> > After merging the hwmon-staging tree, today's linux-next build (arm
> > multi_v7_defconfig) produced this warning:
> >
> > drivers/hwmon/pwm-fan.c: In function 'pwm_fan_is_visible':
> > drivers/hwmon/pwm-fan.c:167:22: warning: unused variable 'ctx' [-Wunused-variable]
> >   167 |  struct pwm_fan_ctx *ctx = (struct pwm_fan_ctx *)data;
> >       |                      ^~~
> >
> > Introduced by commit
> >
> >   439ed83acc19 ("hwmon: (pwm-fan) Convert to hwmon_device_register_with_info API")
> >
> 
> Ah yes. I removed the code that used ctx but forgot to remove the
> assignment itself. I'm surprised it didn't generate a warning for me.
> 
> I can fix it up tomorrow and send a v3 patch series.
> 
Not necessary; I already took care of it.

Guenter
