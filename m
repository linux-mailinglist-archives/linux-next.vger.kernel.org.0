Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 755A37B35F7
	for <lists+linux-next@lfdr.de>; Fri, 29 Sep 2023 16:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232803AbjI2Opt (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 29 Sep 2023 10:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2Opt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 29 Sep 2023 10:45:49 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 225071A4
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 07:45:46 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-405524e6769so4956285e9.1
        for <linux-next@vger.kernel.org>; Fri, 29 Sep 2023 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695998744; x=1696603544; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j1F0jmzSQsTMHopJS20TQ/aPFFBAaPT1nKsTJzCXy4g=;
        b=oKao3nPh6ta+dYX+IxRMVJr80aA42kaHbcqn0H+PRgUd9n2Ul6Tx9OIwqG0VLtTB3m
         myzJCOz47gah3KO+Bzm3tQEISD65DURRaMhGKFWlooXlAgEw4O4KlHdnjv//NspX05lo
         rbGFdITd4oOviSP5pTEEmTRuTtASzGzCnv4q1rt3sNP9HuojATqx9ldFCLRmsDA5Fz1x
         EkARMeSMLrtcAcPpY+w3bgcVMVASneHxEWSlwuahYSd/qaZlOo7EKvhD1WWLj5AqCLqj
         RwQ97vSBXqy9DRuKb2C2he2MK3mSPvJ4Y1oYRuh5KtbF9ljiaD560lT4+npkj9+GEyD6
         q+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998744; x=1696603544;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j1F0jmzSQsTMHopJS20TQ/aPFFBAaPT1nKsTJzCXy4g=;
        b=Z9ssDiHlqVQIJ+RA7sFi79D7aeQ3C9H7dywrlzTrVMbR1OcMjZrLMYpaw8yi50FIXv
         f+HhR+9RcDqQujsxM4Hz2BGLtdmkXFLbRV28LVSfKWHVyDgb8yP6legMTcCiXWpG/QZ6
         n+aVDi49HraX6AgQBGuGk/abLaIdv1ydtU9hURNA4wwdkZsXcD6OGiZZKh8IVV+LYpuv
         At83QGnS5gx6yh7Xgx15zan9DdXalmEqzpcK7HsKjcWRPgaXX4P/8JFqxm1z5/7ZCdH3
         E7TTkCf4KOcnEv/LNiONzsZtMraxhGRmJ550LqYV3MJaQCqMEW/S6hKr6024aUXtiBdx
         SWyw==
X-Gm-Message-State: AOJu0YyfBKZt7PgDV+RF9TuJ7ZMXAA9rRMvmYOI/OfT02qzMP+WVYlVw
        kssOueKLI6QFvylWQ1cA2edyRg==
X-Google-Smtp-Source: AGHT+IEhITBVhRNZEGs03cCgFKEzGiXTWsGzoh/jNUr5RPvZWP24s4gEhBS1OqmZV8t5O4h63M7KFA==
X-Received: by 2002:a05:600c:3644:b0:406:4e2e:b185 with SMTP id y4-20020a05600c364400b004064e2eb185mr3887296wmq.1.1695998744493;
        Fri, 29 Sep 2023 07:45:44 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b9-20020a05600c11c900b0040596352951sm1575517wmi.5.2023.09.29.07.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 07:45:44 -0700 (PDT)
Date:   Fri, 29 Sep 2023 17:45:41 +0300
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
Message-ID: <f43c92cd-bb2f-43a2-8025-707e4274891d@kadam.mountain>
References: <CA+G9fYvVETLEtiZ=MFRrxgXpmgirVHz-tDOxhU=7_9dtmx7o5g@mail.gmail.com>
 <ccc85f1b-e932-4aa1-81c2-185df391fe82@kadam.mountain>
 <511073d8-3292-4914-9bcc-8c9acefe3b9a@kadam.mountain>
 <b2da789f-af96-4269-bd5c-54d4cb6f05eb@kadam.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b2da789f-af96-4269-bd5c-54d4cb6f05eb@kadam.mountain>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 29, 2023 at 05:43:41PM +0300, Dan Carpenter wrote:
> On Fri, Sep 29, 2023 at 05:39:46PM +0300, Dan Carpenter wrote:
> > On Fri, Sep 29, 2023 at 05:18:31PM +0300, Dan Carpenter wrote:
> > > This is weird.
> > > 
> > > I managed to reproduce this once but couldn't reproduce it again after
> > > that.  It seems like an intermittent thing to me.
> > 
> > Nope.  I'm just dumb.
> > 
> > Commit b33a296d8311 ("staging: octeon: remove typedef in structs
> > cvmx_pip_port_status_t and cvmx_pko_port_status_t") updated
> > drivers/staging/octeon/octeon-stubs.h but didn't update
> > arch/mips/include/asm/octeon/cvmx-pip.h.
> > 
> > I can send a patch for that.
> 
> Actually, perhaps we should just revert the patch?  Staging patches
> aren't supposed to touch outside of the staging directory.

I think all of these break the build...

b33a296d8311 staging: octeon: remove typedef in structs cvmx_pip_port_status_t and cvmx_pko_port_status_t
4fffe4733cfb staging: octeon: remove typedef in enum cvmx_pko_status_t
8d26aa90458f staging: octeon: remove typedef in struct cvmx_pko_lock_t
28fae776c69b staging: octeon: remove typedef in enum cvmx_pow_wait_t
a13f7e45823c staging: octeon: remove typedef in enum cvmx_helper_interface_mode_t
7bebd8321776 staging: octeon: remove typedef in enum cvmx_spi_mode_t

regards,
dan carpenter
