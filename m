Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C6C53172F5
	for <lists+linux-next@lfdr.de>; Wed, 10 Feb 2021 23:09:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233370AbhBJWJf (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Feb 2021 17:09:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbhBJWJb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Feb 2021 17:09:31 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7F5C061574
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 14:08:50 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id m1so3294856wml.2
        for <linux-next@vger.kernel.org>; Wed, 10 Feb 2021 14:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wKFzeYvRIfRRujFYeB3I9KIR3XAD4SNxcudP28nmt7Y=;
        b=QFp+i3TNGvPsUwXkX2ihGA4Etg+Wx5kO1fCCq8rk/7MrjtPV05JOc3v9ETrWiRIMZ6
         41jQAQqX0Kzr3Q14yQALiO5howsVzs7F4BkkSNvMCSyiY/j5u0d0lLde/fgKwH5Ag5T7
         SO10KE5WEjOZn9vS2khJlaXeM+31HAMbWH0SMCN9G63QlkjiKEfX7XlfGzUjcE8yunV2
         RtW7Pee25d03kRgg4T8OYjysMsw7EMmy/YgTagJHvpfM9zniHmZMKBXZoO2pLfNv8EtW
         O7v0yR8EYy3pqUVRia5he/X7QtJqFE18pGdIB4R/8WvR+/gH2C0MPmoJ354DdBQA6NGh
         TufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wKFzeYvRIfRRujFYeB3I9KIR3XAD4SNxcudP28nmt7Y=;
        b=OHNUaI7KCp/hO4AeJxmXF7dI1HDRRVaI3ZgfgzYHrVEYPHm/x3bibpH1vCncWodZHq
         PNZRgi5o7WHXgX/o2nV9YetPKH2596PzvUBwh9jb0FufsFpCSEmI64ePvXe3xBgAc1uD
         +IytJ2odEuKF1KOJKdNY1USSwV088kwp9YIVCRftnHGr1+iOjRnxxxSxupa4gSUhHNPL
         g0W9LQX9/nv43g8WMxuvBPQ+b1kQddcFWfynv6m/k2cq/o9YqMpGM3u7NiW33IZn1cKX
         wYOn0rU1UJtVLm37M6OJjhZuTmOYnSiqflzWDjfP3Wr8X1lYwLsB9uFveBoe9zAarknN
         CTUA==
X-Gm-Message-State: AOAM5334GLbVtQRBSxmbPqB3ClJ0qmoe4pki2MzIpyOuDtxiM+jhqVwU
        isx9Wrs1Ym59Pwbd2tjdk8FJ2Wkf/K+h/w==
X-Google-Smtp-Source: ABdhPJz8sz+tGqmc3jaUmyTqU9v2rgN63fl+qoXIl1SQCx59Nf4axlTlTI2KiK3Wg0PEc0wBY61Xpw==
X-Received: by 2002:a1c:2d47:: with SMTP id t68mr1207224wmt.189.1612994928990;
        Wed, 10 Feb 2021 14:08:48 -0800 (PST)
Received: from x1 ([91.110.221.237])
        by smtp.gmail.com with ESMTPSA id n187sm4955293wmf.29.2021.02.10.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Feb 2021 14:08:48 -0800 (PST)
Date:   Wed, 10 Feb 2021 22:08:46 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Doug Ledford <dledford@redhat.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Parav Pandit <parav@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the rdma tree
Message-ID: <20210210220846.GC124276@x1>
References: <20210210211149.3498db8a@canb.auug.org.au>
 <20210210134742.GY4247@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210210134742.GY4247@nvidia.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 10 Feb 2021, Jason Gunthorpe wrote:

> On Wed, Feb 10, 2021 at 09:11:49PM +1100, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the rdma tree, today's linux-next build (htmldocs) produced
> > this warning:
> > 
> > drivers/infiniband/core/device.c:859: warning: Function parameter or member 'dev' not described in 'ib_port_immutable_read'
> > drivers/infiniband/core/device.c:859: warning: Function parameter or member 'port' not described in 'ib_port_immutable_read'
> > 
> > Introduced by commit
> > 
> >   7416790e2245 ("RDMA/core: Introduce and use API to read port immutable data")
> 
> drivers/infinband is W=1 clean right now in linux-next
> 
> But how can I build *only* drivers/infiniband using W=1 so I can keep
> it that way?
> 
> The rest of the kernel is not clean and creates too much warning noise
> to be usable, even with my mini config.
> 
> Just doing a 'make W=1 drivers/infiniband' is sort of OK, but then I
> end up compiling things twice
> 
> Does anyone know a good solution?

I have 2 solutions that I use;

When building locally, I have a special flag for testing branches I
maintain.  The flag indicates that the output should be passed through
a parsing script which highlights entries I care about.  The script
handles lots of other options such as building for different
architectures, running smatch and sparse, etc, but the bit you might
care about goes something like this:

 eval $make $makeoptions $extraoptions $flagoptions $diroptions 2>&1 | (\
 while read line; do
     if echo $line | grep -i "${DIRSGREP}" > /dev/null; then
         print_red "$line" >&2;
     else
         echo $line;
     fi
 done) | tail

This hides almost all output that I don't care about and highlights
the information that is of interest to me in red.

Another solution is to use a builder (I personally use Tuxsuite) to
run 70 different builds (architectures/configs) on *both* a common
base (latest -next, kernel release, stable release, etc) and the head
of the branch I care about and compare the two.  Tuxsuite is nice
since it returns a JSON file with all of the results, so comparison
becomes trivial.

Output of a failed build might look like this:

 $ build-test stable v4.9.257                    # where v4.9.257 is the common base
 Using Tuxbuild to compare build failures/warnings
  
 Tuxbuild the base [v4.9.257] 
 Total 0 (delta 0), reused 0 (delta 0)
 To [remote_repo]/linux.git
  * [new tag]                   tuxbuild-to-test-1414 -> tuxbuild-to-test-1414
 Tuxbuild the current branch [tb-some-topic-branch]
 Total 0 (delta 0), reused 0 (delta 0)
 To [remote_repo]/linux.git
  * [new tag]                   tuxbuild-to-test-1415 -> tuxbuild-to-test-1415
 Waiting for child processes to finish 
 Evaluating the results 
 
 Errors were caused
  
 [v4.9.257] tb-some-topic-branch c18034406e3b ("subsystem: Descriptive commit message")

  arc axs101_defconfig gcc-9
      https://builds.tuxbuild.com/1oIa24eac9ANKJLLMBDgP6zwE5d/ 	 Pass (0 errors - 0 warnings) : v4.9.257
      https://builds.tuxbuild.com/1oIa4WZ1jw4tJtt3mLqTNiX4C1a/ 	 Fail (6 errors - 3 warnings) : tb-some-topic-branch 

  arm allmodconfig gcc-8
      https://builds.tuxbuild.com/1oIa21QYn23XxgnDKUh9as5Pgvc/ 	 Pass (0 errors - 0 warnings) : v4.9.257
      https://builds.tuxbuild.com/1oIa4YT8nEIjaFOaFLuRVId2D7I/ 	 Fail (0 errors - 9 warnings) : tb-some-topic-branch 

  arm64 defconfig gcc-9
      https://builds.tuxbuild.com/1oIa2AR63BljDuvKHKet8Qqga7L/ 	 Pass (1 errors - 3 warnings) : v4.9.257
      https://builds.tuxbuild.com/1oIa4biSryBYrj4JoZlRGpgx8AF/ 	 Fail (2 errors - 8 warnings) : tb-some-topic-branch 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
