Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 013E7379C16
	for <lists+linux-next@lfdr.de>; Tue, 11 May 2021 03:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbhEKBc5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 10 May 2021 21:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229920AbhEKBc4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 10 May 2021 21:32:56 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51AD0C061574;
        Mon, 10 May 2021 18:31:51 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id y12so13509272qtx.11;
        Mon, 10 May 2021 18:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wMM1uYkABc/20SZ/6uSwkCaIlAgHUrUFqx1Ttj/Zj20=;
        b=fl8Y/qmXGzshoNtihZCE/CgHPw95cJzk6xptmmY5E2AtcCoYojhKFdxj9iTGgl2m3t
         7dHVGPYFfpSvZsUzywY8nDT1uSIk154FjwzRPjbL+h43JyqTnDrSuT5dHWjo+bZczhGy
         BxetRIJJYFhipZbN6zYXoe87GH5YViktkzGrM0VFlKk8rXaktmAJzYSD/azDV9BIKKS+
         UrdoPJB5NSbbQZf+uvyP3+zenfuz8KuaDcwRwgz20fCJKQsx4pWyn/5jbDEYWadTIDdN
         PKXGH0GOKBRGXnGRmCl3nt7mlkjc007rGLWNIFBgqnWyBSwyjVoJOcWaIOIqP+alvdmx
         VE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=wMM1uYkABc/20SZ/6uSwkCaIlAgHUrUFqx1Ttj/Zj20=;
        b=lpAcDZT+4JlLQqGLH7ROa4znd9yqJmuvEEFunTYZipIAR7eYe4Fd5ezI9VCiQ3whqA
         SZGahhGUUUXjjTRgH+kClGPXn1DeyNd2RCzWHKLZaX5OqLRsyaGwy17aEdRObb7TE0+/
         oWwX2han19Fq5D4fUbaPiWEzAcv8mAL4Je3Jv96kICX8WkrY0n1/l/piE1Bz43Ug2wwx
         rDbqTV8P532v7KEPEWuUkXLvqccyJSMiWfYKPWj4nHHc7xSYMxpqKcGYgFTzzMkFxdoY
         Ru93uA1eX9ayyHh6QL73c3FDMDZd4JVRnDnulqktnNl4jmCWPJdBsyYIIIKhNp8lJR7j
         axZA==
X-Gm-Message-State: AOAM5311MyBIKUQoF2r2ISPptKRuWmAiwpz65sldUr8wvgAQ9IRMDc6P
        jqrrQdNrjnMWw6ebNFbV9p4=
X-Google-Smtp-Source: ABdhPJzcSK1BWCnVIo6WT3nekBiz7F72EvtUIiSHpvAbH+ki/oyiYBgifga9j9tO/rNogLU1sfUu8A==
X-Received: by 2002:ac8:730c:: with SMTP id x12mr25056529qto.275.1620696710499;
        Mon, 10 May 2021 18:31:50 -0700 (PDT)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [199.96.183.179])
        by smtp.gmail.com with ESMTPSA id i11sm12883884qtv.8.2021.05.10.18.31.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 18:31:50 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date:   Mon, 10 May 2021 21:31:48 -0400
From:   Tejun Heo <tj@kernel.org>
To:     Roman Gushchin <guro@fb.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the cgroup tree
Message-ID: <YJnehL0+BbrZVeY6@slm.duckdns.org>
References: <20210511105114.55e90534@canb.auug.org.au>
 <YJnZjCXe7uPrJxFo@carbon.DHCP.thefacebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJnZjCXe7uPrJxFo@carbon.DHCP.thefacebook.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, May 10, 2021 at 06:10:36PM -0700, Roman Gushchin wrote:
> On Tue, May 11, 2021 at 10:51:14AM +1000, Stephen Rothwell wrote:
> > Hi all,
> > 
> > After merging the cgroup tree, today's linux-next build (powerpc
> > ppc64_defconfig) failed like this:
> 
> Hi Stephen!
> 
> I've noticed this error and sent v2 almost immediately after the first version,
> however it looks like the first version got merged by a mistake.
> 
> Tejun, can you, please, drop the first version and replace it with v2?
> There is a trivial s/task/tsk fix.
> 
> Thank you and sorry for the confusion!

Done, thanks.

-- 
tejun
