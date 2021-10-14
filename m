Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D729342E4BA
	for <lists+linux-next@lfdr.de>; Fri, 15 Oct 2021 01:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232335AbhJNXYG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 Oct 2021 19:24:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbhJNXYF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 14 Oct 2021 19:24:05 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CAFC061570;
        Thu, 14 Oct 2021 16:22:00 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id y7so6779317pfg.8;
        Thu, 14 Oct 2021 16:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Pz7wpNudlFp0iJ4ceF8FtD9oN6fD0QtioM4sSlEJ8dg=;
        b=CNtu3IVYffo8MHC2GdIeqq/qAPhnLr12J1ULaQFkkxbsxpFUvr7n2wLticHtu4c3Rq
         JgbgyuIIDURlWv0uqkWXpTvRF5q+vyysJblTU1C5elNjtb/UUrEPcNH5c6V5iCrnOeYj
         skTyNL5snAdkkYVA2mCrm6xFSiL4V6VAx9O+SBaIALPsY7JwBBQmZnCMjWoDTX3bYE4B
         or5BdUdjMk0s/vfqaniduu4E48JVmh102ufKDGDiIhVFCwK5r9wmaNwFpTzJxJs6dQCP
         sXFSm7mbuGGeqyDzmqLBH1rpn7PYSfBnvDifnX4WhTs4mKQg0qgcSi8WhYGbX6sF5I0W
         mc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Pz7wpNudlFp0iJ4ceF8FtD9oN6fD0QtioM4sSlEJ8dg=;
        b=bxVOkrWzxsaNE++rPxc4sAOSsvfwetg+UnfbpPm+cLXgueZ9hcsKrWfTWCvrRPAnxo
         7BFW5gIzF/oMwuh6YgOboH4gP1HFClDEQM9+qcBWpZP29f6R540gAdoYq5r9vtOVTiRU
         1oveQiVvYTV1kbx8Eesgjn0+czjzEFJcD3q7rifqie6Fnw5S35qJ13hzxha7WMTSnRqb
         LVsQRJBMfeYy7sz7YpUQVeVWY+8ufYBqmyjeiF9xKbM47VXK6kFFYHtQcQjcv15yW/rO
         +h65daF5dUdKV0XHDqnOcqzoVzbpywbwRDzslHZX8cqVBJJixh2SCGCz8PlquwRiLAp3
         2hsg==
X-Gm-Message-State: AOAM533Ohy9IALpTCMPeWdQJElw000MTjNXSqSYYZrbl72Gel6kDZBBu
        D7P3aoyliw+jrxQ4aCZi4YI=
X-Google-Smtp-Source: ABdhPJyKAMFpl1Lke85fC3bxHNLBHwylVYdYKLXUW2MD0IbzVSpt+eLUYVjJHqJo2Iy4PeEjzUdnQw==
X-Received: by 2002:a05:6a00:1501:b0:44d:8dbe:ca59 with SMTP id q1-20020a056a00150100b0044d8dbeca59mr2833289pfu.75.1634253719468;
        Thu, 14 Oct 2021 16:21:59 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id e15sm3256633pfc.134.2021.10.14.16.21.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 16:21:58 -0700 (PDT)
Subject: Re: linux-next: Signed-off-by missing for commit in the arm-soc tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        ARM <linux-arm-kernel@lists.infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
References: <20211015092934.726ed2d4@canb.auug.org.au>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <a1f2f236-73ea-2459-63bc-8f51ae0231b2@gmail.com>
Date:   Thu, 14 Oct 2021 16:21:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015092934.726ed2d4@canb.auug.org.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 10/14/21 3:29 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Commits
> 
>   3f3247285461 ("ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address")
>   13dbc954b3c9 ("ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address formatting")
> 
> are missing a Signed-off-by from their committer.

Yes that is because I had to rewrite Nicolas' Author email to match his
Signed-off-by and in the process I became the committer and did not add
my Signed-off-by.

Nicolas, the commits you had submitted to me originally used your
@redhat.com emails in the Author/From, whereas the Signed-off-by used
your @kernel.org address. Can you have both match for next commits?

Thanks!
-- 
Florian
