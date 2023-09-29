Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 02DA27B35E1
	for <lists+linux-next@lfdr.de>; Fri, 29 Sep 2023 16:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbjI2Ojz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Sep 2023 10:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbjI2Ojy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Sep 2023 10:39:54 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11275CCB
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 07:39:51 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32320381a07so9788809f8f.0
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695998389; x=1696603189; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=g0n0edkpamdnggcIL12+CfmK30X8YtzkvBLd1C9oNcw=;
        b=OjYQGob2e3WyVDAmsUo3KtpOWoNVylLVm/Hb5prdpS4tTPmV57u+fgEeycOTqoPJew
         lMoEHRFdS/3Bml8d4kDPkJeOsEbcAz4fhfm4UGStXMM8uDKPKtOWFSIGdl+oxnvOS41q
         Co3zbqwO3w+ki9UyGG1ZwP6WlfQy1cf6xYQCawkRfFskGilpQrKwyce4Z92Gtw+ZnJ9E
         KO9lZdyZ+Bux/tuYATy5CE/WuvpY6Rw3EXagLgmEFRPZJuygZFkoO4UgBXd/eDS/TocB
         17zAJe+k6USSzw1FgQdGIkdbG/9FcWRz3A1OzPwO4E02IES5+xho1eJ8Z2MyXJPY4KL5
         xb1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998389; x=1696603189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g0n0edkpamdnggcIL12+CfmK30X8YtzkvBLd1C9oNcw=;
        b=TA9B4qaRVF0nGh9x2y6aubHzp6q/bYUuao/DIdq5z8TwlD+Y4Y0O3n+3xzL3qF8Z9i
         5FsFDtGyYWBk+vVoiLBdFlFLtcFkNMYdpkuA0i7WgvXxWOYiNdDoUW2+VnrX5vftdhlJ
         tuzu9OVinYVI0t74Q3eVh5ibHoUSYJQ15sVteH9eOSQJ1kkVIVAwYQOQvzfQxYW9tlFP
         nGtdOPDiNE4WPWbJDGdxR68E+osbq6jWNnNP2LqaXjmnjYoXMn0cktYrKKEAi3mo0Tzu
         rfEGDczVRqF/oP5k4au7QlXJo5skDURNSvkfk91cMpMxmE/VsuEDRzkp0hTpwxZ0P8bF
         046Q==
X-Gm-Message-State: AOJu0Yyw6b3zgftMpxgriQcPG/TuLTtgSbHjByX+F94rtQ7QSCBcyUu1
        Wd630hGrA8KI3I0mvVRn0GFm6A==
X-Google-Smtp-Source: AGHT+IFoAUwDv0XK2dj73ZcFMz7DCZ16csYuvmZltRzNzDRjW81zJcU5aferUNM8qkUyXoNv8CSNJQ==
X-Received: by 2002:adf:e7d1:0:b0:324:885f:f7fd with SMTP id e17-20020adfe7d1000000b00324885ff7fdmr4221888wrn.15.1695998389377;
        Fri, 29 Sep 2023 07:39:49 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d650b000000b00318147fd2d3sm21646483wru.41.2023.09.29.07.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:39:49 -0700 (PDT)
Date:   Fri, 29 Sep 2023 17:39:46 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mips@vger.kernel.org, linux-staging@lists.linux.dev,
        Oliver Crumrine <ozlinux@hotmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Subject: Re: next: mips: cavium_octeon_defconfig failed -
 drivers/staging/octeon/ethernet.c:204:37: error: storage size of 'rx_status'
 isn't known
Message-ID: <511073d8-3292-4914-9bcc-8c9acefe3b9a@kadam.mountain>
References: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
 <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 29, 2023 at 05:18:31PM +0300, Dan Carpenter wrote:
> This is weird.
> 
> I managed to reproduce this once but couldn't reproduce it again after
> that.  It seems like an intermittent thing to me.

Nope.  I'm just dumb.

Commit b33a296d8311 ("staging: octeon: remove typedef in structs
cvmx_pip_port_status_t and cvmx_pko_port_status_t") updated
drivers/staging/octeon/octeon-stubs.h but didn't update
arch/mips/include/asm/octeon/cvmx-pip.h.

I can send a patch for that.

regards,
dan carpenter

