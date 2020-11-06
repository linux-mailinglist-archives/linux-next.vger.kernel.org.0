Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F20C22A9264
	for <lists+linux-next@lfdr.de>; Fri,  6 Nov 2020 10:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgKFJV7 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 6 Nov 2020 04:21:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgKFJV7 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 6 Nov 2020 04:21:59 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC143C0613D2
        for <linux-next@vger.kernel.org>; Fri,  6 Nov 2020 01:21:58 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id 23so524693wmg.1
        for <linux-next@vger.kernel.org>; Fri, 06 Nov 2020 01:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xECvU3FABW/JOy42DkSlWBBqPmissQ1l6KjhuN6QHIU=;
        b=pdAwI7BYqw4StZpHSFZKv+L6PzoWG/hoCfzm4OU7rH558yG14ilYq4pn2GWJKpgVva
         oog/PG+iCURp9tbIpr9JIckEWRMdS4GInF0lZuyh4qm0bsGU1sE5Qxoqm5ww86slNp7H
         nENeR54k/onAibjIBl/i2LRXPwTAS5tukAVtQH/T3CqQXe1aqPXHNPmW5AxJKxpWDEde
         AypeC6Mxi0SkQuUNunJfQrY9wwX9RdeH37FuLo47Z3xnXq5tRmlNQC+Acbo9M66zviIq
         ulEq63NINRvkWrDQgNEWz3Xe8ZPjaffZ0YLLQAKOqdpC2Pmh4FSRhIBQXYiZhtc4PFl2
         ApLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xECvU3FABW/JOy42DkSlWBBqPmissQ1l6KjhuN6QHIU=;
        b=mcvfQ8/FBqtLRuv87kIY1FZCeCGCu1zaoR9AMZhc/liQecCQR3ggMcdkxhxJuRakvj
         qBo8/zvJWon9nFR1KCrj4/nzarw2f6381qEPm74mt0gZV0DsGZeKsss9s3p6iG7NADEq
         NSvM9RcUJqdmMJG8ejitm9mD752oYPXZNyt5NgIfD8QD6DEI1WxN0lzcW32P7dAgeY6s
         03LybmQpTb8kx429FO4vk+l80XRtOzHoFAQgzXLPh8OSumozzK7xBId6lRmKMWELaFTd
         Y8jP0GKPCkQnu7VIS2K+J4PCiBJrQZhs2OZKf3ar0bGOXactE8gEF+jiYGw3F5Q6B02q
         pGzw==
X-Gm-Message-State: AOAM531TitfOsWp/fTh70IcbZisb4Tcp4OCPL1od+s5u7DoPBSvchOzF
        dRXoe6FMq1dAx3KZeGEQjRTcGg==
X-Google-Smtp-Source: ABdhPJzR5L/dO2O73HTcfCIQpDJQ8LleKR3AxbKi8sQAidJ78vg4x75R19vbW8IAZJjymVkdFxjC1A==
X-Received: by 2002:a1c:490b:: with SMTP id w11mr1347316wma.101.1604654517289;
        Fri, 06 Nov 2020 01:21:57 -0800 (PST)
Received: from elver.google.com ([100.105.32.75])
        by smtp.gmail.com with ESMTPSA id v123sm1383820wme.7.2020.11.06.01.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 01:21:56 -0800 (PST)
Date:   Fri, 6 Nov 2020 10:21:49 +0100
From:   Marco Elver <elver@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Alexander Potapenko <glider@google.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-mm@kvack.org, kasan-dev@googlegroups.com
Subject: [PATCH] kfence: Fix parameter description for kfence_object_start()
Message-ID: <20201106092149.GA2851373@elver.google.com>
References: <20201106172616.4a27b3b3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106172616.4a27b3b3@canb.auug.org.au>
User-Agent: Mutt/1.14.6 (2020-07-11)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Describe parameter @addr correctly by delimiting with ':'.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Marco Elver <elver@google.com>
---
 include/linux/kfence.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kfence.h b/include/linux/kfence.h
index 98a97f9d43cd..76246889ecdb 100644
--- a/include/linux/kfence.h
+++ b/include/linux/kfence.h
@@ -125,7 +125,7 @@ size_t kfence_ksize(const void *addr);
 
 /**
  * kfence_object_start() - find the beginning of a KFENCE object
- * @addr - address within a KFENCE-allocated object
+ * @addr: address within a KFENCE-allocated object
  *
  * Return: address of the beginning of the object.
  *
-- 
2.29.2.222.g5d2a92d10f8-goog

