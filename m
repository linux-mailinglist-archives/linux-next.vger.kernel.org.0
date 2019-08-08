Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 962D4868F2
	for <lists+linux-next@lfdr.de>; Thu,  8 Aug 2019 20:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732708AbfHHSlx (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 8 Aug 2019 14:41:53 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41506 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732375AbfHHSlw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 8 Aug 2019 14:41:52 -0400
Received: by mail-pf1-f193.google.com with SMTP id m30so44593388pff.8
        for <linux-next@vger.kernel.org>; Thu, 08 Aug 2019 11:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZZK+fyWZjI5hSA6Qnbu9v76+SqqCqOmIE8jtu8ZGPCs=;
        b=ExxwGCibE21sc8KG1HZ0UsxlIUpqyquINJWIphQpP5BWrLFQuJbqM4/Qa7y3EMxKGk
         u5GrGX64wvkaZU+q6huAtHVuqAWkaBkPCF09bpKs83rYE18bh7Opf6p/xeKnNX4sdGhC
         oDGkV/1+tjK/DcGSuQfRH1Z96wbZdk1yEiXeUCRmPxZjqQicjt4fbjddbAx7fQ9v3YRz
         cgNr5lvQHbORziE5OshBxu2MkX5j7ncutuywKLkv8ixmo964EOdprPS4GdWPqXMuYnQ2
         2CY8UqquYB980H1NQ5wV+zbU/siUvCMJLrAWUTzGsyDKN4UN8+vVrmXbb30AoINnzMAt
         HRFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=ZZK+fyWZjI5hSA6Qnbu9v76+SqqCqOmIE8jtu8ZGPCs=;
        b=Ah1q/ElNDNRxDQ453nY5Hh7RtNLyM+UXBQsj7LNnMKrWIAhS/l8hQhdpRB4A2uolXz
         0ySu0JaPBKwC2MXFMd2GKSxfrLceoKWf3IvopKtF6v/tnTre++WFS/JknN5kpdTfH3bF
         seX3ZdU3NR1xFr7obT4wUQ/aBuYsZrWM1r5zZVwGbEXMjdjN8tO7tl/w1IStS+JZBWPO
         yw2Km/qhm91x3oDeW2diqkg8KWZWGSXXHLehhsIhcUy+D0y/SWZKikabuLjYgNhzsYno
         xy94LS3vqtSscPs7f83X/vSzbfqiHNqUE7WjDxV/co/YTuVnZp/3h+VRhOjosTpUSMON
         0P+Q==
X-Gm-Message-State: APjAAAV9WL4LrYeX5ab1C6AchcSq/K1mPswSZIRz4MCsqb8VoohsEfqW
        WRw89tuDk35kw7K6NgsgYAA=
X-Google-Smtp-Source: APXvYqx5EmGw/rrd/R2q+S2qeMRTUxcFUUR9uhxx05XW9ppoZP59FXTb8pky/sKgdxdcuILdqHHe+g==
X-Received: by 2002:a17:90a:7787:: with SMTP id v7mr5462994pjk.143.1565289712264;
        Thu, 08 Aug 2019 11:41:52 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id n17sm102767545pfq.182.2019.08.08.11.41.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Aug 2019 11:41:51 -0700 (PDT)
Date:   Thu, 8 Aug 2019 11:41:49 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Mark Brown <broonie@kernel.org>
Cc:     Alex Deucher <alexander.deucher@amd.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        David Zhou <David1.Zhou@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Tao Zhou <tao.zhou1@amd.com>,
        Dennis Li <dennis.li@amd.com>, linux-next@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        kernel-build-reports@lists.linaro.org
Subject: Re: next/master build: 230 builds: 5 failed, 225 passed, 6 errors,
 1344 warnings (next-20190805)
Message-ID: <20190808184149.GA441@roeck-us.net>
References: <5d47f990.1c69fb81.a5d88.ee1f@mx.google.com>
 <20190805111205.GB6432@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190805111205.GB6432@sirena.org.uk>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 05, 2019 at 12:12:05PM +0100, Mark Brown wrote:
> On Mon, Aug 05, 2019 at 02:40:32AM -0700, kernelci.org bot wrote:
> 
> Today's -next fails to build an arm allmodconfig due to:
> 
> > allmodconfig (arm, gcc-8) — FAIL, 2 errors, 16 warnings, 0 section mismatches
> > 
> > Errors:
> >     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:279:9: error: implicit declaration of function 'readq'; did you mean 'readb'? [-Werror=implicit-function-declaration]
> >     drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:298:3: error: implicit declaration of function 'writeq'; did you mean 'writeb'? [-Werror=implicit-function-declaration]
> 
> due to 4fa1c6a679bb0 (drm/amdgpu: add RREG64/WREG64(_PCIE) operations)
> which introduces use of readq() and writeq().

AFAICS this problem affects all 32-bit builds, including i386.
Is it in the process of being fixed, or should we submit a
patch limiting DRM_AMDGPU to 64-bit builds ?

Guenter
