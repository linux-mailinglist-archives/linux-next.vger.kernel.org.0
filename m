Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDEB433DC6A
	for <lists+linux-next@lfdr.de>; Tue, 16 Mar 2021 19:19:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236022AbhCPSS3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 16 Mar 2021 14:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239934AbhCPSSP (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 16 Mar 2021 14:18:15 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794F8C061762;
        Tue, 16 Mar 2021 11:18:14 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id 16so16741275pgo.13;
        Tue, 16 Mar 2021 11:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+8MVe2A9jN3BC6k8+aXGfRVSRAYyFjS7b+watDuerM0=;
        b=HmiBulnAWNW/H37EVUjin9X0OUhr9H5V8DHIuveuavs/cREL5pU1aaQ8L6rDhCYP3T
         0Kh5zPokkX2/pHOsZdAYqEQgEQriIeUclAA2MLUKfZPimoDpDN8h+Zt4VaQtetDmAhjz
         RaEXHkUOCwG9tGaB1cLljl2/QFth308IlNoaLfVer4yZKcbqCdopUZW6AArdvIHPXEkK
         fzErrDh3vkmotH3OBDaTGpwsp8t4WissnUyrhTgWamlTR+jmLZe0rQ3ONVjT+/OFBPL5
         2VwbCHVZJe0PrJc+pU218NttR7UjyU/eRGh6jnGxrD8VicaqtkP7kG5bxKyAq2P/reye
         HO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+8MVe2A9jN3BC6k8+aXGfRVSRAYyFjS7b+watDuerM0=;
        b=VUuWeLxbTnTZAnfDidDYwT+kfqvIVScBYgSMJQyR7dHkvZzX2VgLnyhhjBZg2DoOMw
         qMYVkx/yglyATIz5SbDlL6qgbewYL7kFt8O3pwj6eP+pi8Jk9WyJZRCAjzQ1K+sFffQC
         4JObqM6VLadb2h7l7obxmAu7NMYUbSuvgIJuO/VrI7Ef6Asnkl/fWRlIJGgJP4FJOzHQ
         GAAKAvTVW9VQ5HEs9dzABbNKIhoHml0quBWOjjJoQOvkU+t2sEwb4y79qRt28VraUJ3c
         2qb+CFhiapdn+T9UUwLCyN22SDlUM4sZrCdz6f7ePUJ9EyZMCZGNdt9BZc+MaHjcQ2Ts
         z2YQ==
X-Gm-Message-State: AOAM53038t7CNqwHowyeL1Ov0fWQQmhb/LTJQL0MAC2RPuA8+P9gFFBf
        /7W0Ki3XsWnu1ZXYo4u9zvm3RLTiqTY=
X-Google-Smtp-Source: ABdhPJwYWrBl9apAnMlDOvtNBc5VCTtwgU0L3d7R3y1lbuKWeRTkPGSjSDKyxFbZwlQT/lOWTpA8qw==
X-Received: by 2002:aa7:9a94:0:b029:1f4:ec7:fd2 with SMTP id w20-20020aa79a940000b02901f40ec70fd2mr618109pfi.48.1615918693992;
        Tue, 16 Mar 2021 11:18:13 -0700 (PDT)
Received: from google.com ([2620:15c:211:201:4160:1d48:d43e:7513])
        by smtp.gmail.com with ESMTPSA id u2sm17192423pfn.79.2021.03.16.11.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Mar 2021 11:18:12 -0700 (PDT)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Tue, 16 Mar 2021 11:18:11 -0700
From:   Minchan Kim <minchan@kernel.org>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the akpm-current tree
Message-ID: <YFD2Y++LQHmWMx68@google.com>
References: <20210315163522.589bc67a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210315163522.589bc67a@canb.auug.org.au>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 15, 2021 at 04:35:22PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the akpm-current tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/ABI/testing/sysfs-kernel-mm-cma:2: WARNING: Inline interpreted text or phrase reference start-string without end-string.
> 
> Introduced by commit
> 
>   439d477342a3 ("mm: cma: support sysfs")
> 

Hmm, I don't get it what happened here. Was it false-positive?
