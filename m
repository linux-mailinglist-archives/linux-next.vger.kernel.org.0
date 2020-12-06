Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75C642D073D
	for <lists+linux-next@lfdr.de>; Sun,  6 Dec 2020 22:06:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727974AbgLFVGV (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 6 Dec 2020 16:06:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727892AbgLFVGV (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 6 Dec 2020 16:06:21 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0627CC0613D0;
        Sun,  6 Dec 2020 13:05:35 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cw27so11579840edb.5;
        Sun, 06 Dec 2020 13:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=0m779MRexPoP7pQQyysjLrE0HDQY6yPdqg+0AgAzsMo=;
        b=ZBGEA5HhKJ9yfKvxbHQCM6MomKnKY3cE7z/iUKKiVvemLO5EjQSb+jG2QDB60EVYiN
         jHF7flalpOIK0pwkdeastN/HY8JrymO/+IPZaiacdZcbb25q2/fbg1EncJDaG1BV/qbd
         HpXnOMv2sh27w3FbtLFaaS7+vQ0+3XmFGCp5QFrCCUyVpVi55K4KeEiA32w3DuAJKm0W
         Zm9/Ny2ujYQvJ5Dwf5CHmN4TRNjLwJT4oqmqrSiwbRlYLh8AsRgD2XUp1X9NxMQ5ouR3
         VTVBIgIPsfkmLT5khSClMUDDykPQTJk0r7rO1D7ujUCOUmXOhGCl6gAdSKAf+neKXWAa
         ClKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=0m779MRexPoP7pQQyysjLrE0HDQY6yPdqg+0AgAzsMo=;
        b=ksVo+xS9dlXgTKIZKkRYS+Heep2So+ZxbpYFpkrdfTV0ID6zy3/kBPXgxvAo7/LmKt
         y0BQkfZgyIhTpyap6Tg85vxmZ3SMIl0sG1tivrdaX1xSiAnlOJWfm0PaBVSxonXUxhfL
         XUnx0urUEP8hE+us1S8LoHmNqMDRLsbYMWDmDGMK4D1vUf/iTdL6lhvx+OQD/aKM7bmr
         MVqLFjcO5n+GQMYWmKnokbOWCMJpqeoeTbLGKQPVwEghk5ew6hjavmzEEsV3g611NUY6
         wxK9+N6G9lCZbuM4GvVqQu4EnU4IuTO/b9xBTwoRNJ86pdR2Cravk5kS14Fp7IMJDxAo
         TfaQ==
X-Gm-Message-State: AOAM530mzUNvik3juWyB3clKodtET8Ic2liE61aRVr9nVbABJcoWNQRJ
        ApGAKLc028uKOpmTw+OcXEM=
X-Google-Smtp-Source: ABdhPJxm64BpyTW9k7eJC6vOAIIyPl3R1EKDNIz+CCc3TcDTWBDwo715prwC7d12bA+NZ+TCuzQzMQ==
X-Received: by 2002:a05:6402:1d9a:: with SMTP id dk26mr17225283edb.283.1607288733318;
        Sun, 06 Dec 2020 13:05:33 -0800 (PST)
Received: from [192.168.74.106] (178-169-161-196.razgrad.ddns.bulsat.com. [178.169.161.196])
        by smtp.gmail.com with ESMTPSA id r24sm7361007edo.4.2020.12.06.13.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 06 Dec 2020 13:05:32 -0800 (PST)
Subject: Re: linux-next: Fixes tag needs some work in the drm-msm tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Rob Clark <robdclark@gmail.com>,
        Sean Paul <seanpaul@chromium.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20201207070517.28951ed0@canb.auug.org.au>
From:   Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <5820a22b-6fce-20ee-2a48-58c2d57b4ac4@gmail.com>
Date:   Sun, 6 Dec 2020 23:05:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201207070517.28951ed0@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 12/6/20 10:05 PM, Stephen Rothwell wrote:
 > Hi all,
 >
 > In commit
 >
 >   9b73bde39cf2 ("drm/msm: Fix use-after-free in msm_gem with carveout")
 >
 > Fixes tag
 >
 >   Fixes: 4b85f7f5cf7 ("drm/msm: support for an arbitrary number of 
address spaces")
 >
 > has these problem(s):
 >
 >   - SHA1 should be at least 12 digits long
 >
 > In the furture, this can be avoided by setting core.abbrev to 12 (or 
more)
 > or (for git v2.11 or later) just making sure it is not set (or set to
 > "auto").

I'm sorry, I copied and truncated the hash by hand. I should have used

     git log --pretty=reference

Also scripts/checkpatch.pl didn't notice it. Should I submit v3 of the
patch or it's too late.

Regards,
Iskren

