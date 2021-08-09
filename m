Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0E7D3E4F90
	for <lists+linux-next@lfdr.de>; Tue, 10 Aug 2021 00:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236916AbhHIWzZ (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 9 Aug 2021 18:55:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233239AbhHIWzY (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 9 Aug 2021 18:55:24 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E27C0613D3;
        Mon,  9 Aug 2021 15:55:03 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id nt11so7119611pjb.2;
        Mon, 09 Aug 2021 15:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lI4ZDMPYg0X6WKHX4ovZRXWmFdkn+y2fs9XUhX1B/eg=;
        b=rNm4Duq6RdYXLDIg4EhsGSQX5fuH3YTUUnIfHEhq8jkJqp4M4xyoTFYeaHavvzb8Xq
         LLStm0doo+vWHEWyKKOJMAcXeeJIjiN2LKjK/3wwMdNG0Eg5c/B7uzyvAmcV0+t7pQ8L
         3P7lRtNJeqkD9QpwgKweyFo133yTQJxv1jc8IegutqAdzdpHjrGfLZJX1johlj5sgJl3
         3ra+3624KydT3CTvXcO4K8+/opzPVrRjfQ1rxaONaHKshqYAJMPoFMybZqTMM30vOiA9
         Xjo4CaZVPe+AcGR65crA24PC/EYLCfSWtW9/8CF59HRG4XSr9sjdrWMAEp1f69wHSdrw
         x96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=lI4ZDMPYg0X6WKHX4ovZRXWmFdkn+y2fs9XUhX1B/eg=;
        b=dy5lzYMlwW5S17tgpF7fQPGpd5Zq9gxjyfW0d5QcN5V+KKXoVW1bCQUnZggIGrw1g9
         11N1ujA12nRf9msgf+SsG0oEqAgiAXlBJEF5z4ZC8DxHSKzu2uo4Q/iSrognavIVlnm2
         J0nqyq0kiJzquqSlAGF4JaE/PG5faOv/L1r1de5ieUhKUoojKT/W/M2gsBVIc8VIA5kA
         aaWiPx7sly5e+iG6uZS7CMRJcDQ0F4FAz8QeHSzYh2LkgVUYCUM3eo6nUM9DsvZ37Xma
         5BZMtsohpoAs/U0/LmBWVjrsrKGP0XjX8gk59ssnfcSIbQCdOxwf7pJceAcHWEoMN4d+
         /oZQ==
X-Gm-Message-State: AOAM532mr7J5VLRfB4OwLHw7PAMTeOeo4nqBlFH+euW23w+1Kz6ZEWq7
        TlNOB2Mw1ioCfysOJIO08KPsSrpNJ1+F2g==
X-Google-Smtp-Source: ABdhPJx5RrrmuypZfJJv4Jg/PsRdOEuQZqf/ca71PRKQwCXdmzGzmCFqMY4ylx23xQrqbXWtsHByKw==
X-Received: by 2002:a17:902:da8d:b029:12c:5241:c24e with SMTP id j13-20020a170902da8db029012c5241c24emr22100530plx.35.1628549703073;
        Mon, 09 Aug 2021 15:55:03 -0700 (PDT)
Received: from localhost ([2620:10d:c090:400::5:df1c])
        by smtp.gmail.com with ESMTPSA id g3sm20337844pfi.197.2021.08.09.15.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 15:55:02 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Mon, 9 Aug 2021 12:54:58 -1000
From:   Tejun Heo <tj@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Waiman Long <longman@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the cgroup tree
Message-ID: <YRGyQuvE5FClG3s0@mtj.duckdns.org>
References: <20210810085146.0b9ec2b5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810085146.0b9ec2b5@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 10, 2021 at 08:51:46AM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   f944e005aa9b ("cgroup/cpuset: Fix violation of cpuset locking rule")
> 
> Fixes tag
> 
>   Fixes: 4b842da276a8 ("cpuset: Make CPU hotplug work with partition)
> 
> has these problem(s):
> 
>   - Subject has leading but no trailing quotes

Fixed. Thanks.

-- 
tejun
