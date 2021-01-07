Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B36A72EC75F
	for <lists+linux-next@lfdr.de>; Thu,  7 Jan 2021 01:39:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726212AbhAGAjN (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 6 Jan 2021 19:39:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36247 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725803AbhAGAjN (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 6 Jan 2021 19:39:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1609979866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=PZJysm9mhMs1vBRXKoARzZAsE8IJ9JXbKKeY+zpyAV0=;
        b=Netk/UKxO7Q25JwdHvLk5NOzitz4B5xWp08ai9zKSn/tw+7+fVI63CXip2TVnfAQM3M3Hn
        EfJnHRDgSDytLdzMS+0FR9NiV0ieezUdJYeSONUftahjrY487173u2vKX5XNjusijfUKML
        k9jZL7m5IilM8RsbOtVfAZf4kBu0q8Q=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-447-I9_9rZvXN1i7Jxhk0YWiCA-1; Wed, 06 Jan 2021 19:37:45 -0500
X-MC-Unique: I9_9rZvXN1i7Jxhk0YWiCA-1
Received: by mail-pj1-f71.google.com with SMTP id gt6so2840097pjb.7
        for <linux-next@vger.kernel.org>; Wed, 06 Jan 2021 16:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PZJysm9mhMs1vBRXKoARzZAsE8IJ9JXbKKeY+zpyAV0=;
        b=FFClAFpuCyfEjx+x0mpOl2e3o09ea+CQEC4mgMzBMO2prC/KkvOqdY97chjnTZGDcf
         IddPVkcVJlg+AH7x6Pcha4j1ZOaiShREVqsgH+fOw9de6LpsuLw1SYuFqM8UI2QA/+xi
         iXcZECWAm98f6mJqDWdKN2nPb1x/SgN9xLX4LOOLn8JusA8zG6DK2KhgnF3ybIupUw+a
         hCCfvbUfkSx50G0byQrPIHvYCwWeo56QWJ6a9roBxM4fDA/lwaRnGB3L1u/mZPjmIQA4
         4V364TTPnpHqmkv+DtJkw1FM0V+n1w3/DgIw0q5FzvBm79p69+9QFZ/IVaGoxR9ihFsd
         m8mA==
X-Gm-Message-State: AOAM533QgHzEJ/DAhoJEcuMG3wNwyfuonRZOEaAO2e8sQnnwFOfkMsoA
        1yDuabQSRFA7QsCjwwiZycALGaHxU9SoeVBfhLjYnIpy2+RQZcFoEHDfYPfyFAZpDGJis2IJiUo
        OsRDkHIBjk49NN/zQFbtWtw==
X-Received: by 2002:a65:4347:: with SMTP id k7mr7138467pgq.186.1609979864120;
        Wed, 06 Jan 2021 16:37:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzz2Zls6s49VpIvvKtVzEWGm4eY+aco8/7VnaUqQvUSaGlhhr5XpOekEYJi255jN+exwtP+ow==
X-Received: by 2002:a65:4347:: with SMTP id k7mr7138450pgq.186.1609979863893;
        Wed, 06 Jan 2021 16:37:43 -0800 (PST)
Received: from xiangao.remote.csb ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id v2sm3461818pgs.50.2021.01.06.16.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 16:37:43 -0800 (PST)
Date:   Thu, 7 Jan 2021 08:37:33 +0800
From:   Gao Xiang <hsiangkao@redhat.com>
To:     Al Viro <viro@zeniv.linux.org.uk>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs tree
Message-ID: <20210107003733.GA304388@xiangao.remote.csb>
References: <20210107101544.68bdd395@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210107101544.68bdd395@canb.auug.org.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Al,

On Thu, Jan 07, 2021 at 10:15:44AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs tree, today's linux-next build (x86_64 allmodconfig)
> produced this warning:
> 
> In file included from fs/erofs/xattr.h:10,
>                  from fs/erofs/namei.c:7:
> fs/erofs/namei.c: In function 'erofs_lookup':
> fs/erofs/internal.h:23:21: warning: format '%s' expects argument of type 'char *', but argument 4 has type 'struct dentry *' [-Wformat=]
>    23 | #define pr_fmt(fmt) "erofs: " fmt
>       |                     ^~~~~~~~~
> include/linux/dynamic_debug.h:129:15: note: in expansion of macro 'pr_fmt'
>   129 |   func(&id, ##__VA_ARGS__);  \
>       |               ^~~~~~~~~~~
> include/linux/dynamic_debug.h:147:2: note: in expansion of macro '__dynamic_func_call'
>   147 |  __dynamic_func_call(__UNIQUE_ID(ddebug), fmt, func, ##__VA_ARGS__)
>       |  ^~~~~~~~~~~~~~~~~~~
> include/linux/dynamic_debug.h:157:2: note: in expansion of macro '_dynamic_func_call'
>   157 |  _dynamic_func_call(fmt, __dynamic_pr_debug,  \
>       |  ^~~~~~~~~~~~~~~~~~
> include/linux/printk.h:424:2: note: in expansion of macro 'dynamic_pr_debug'
>   424 |  dynamic_pr_debug(fmt, ##__VA_ARGS__)
>       |  ^~~~~~~~~~~~~~~~
> fs/erofs/internal.h:34:33: note: in expansion of macro 'pr_debug'
>    34 | #define erofs_dbg(x, ...)       pr_debug(x "\n", ##__VA_ARGS__)
>       |                                 ^~~~~~~~
> fs/erofs/namei.c:237:3: note: in expansion of macro 'erofs_dbg'
>   237 |   erofs_dbg("%pd, %s (nid %llu) found, d_type %u", __func__,
>       |   ^~~~~~~~~

Thanks for modifying this. Use %pd is more reasonable than using d_name...
It might be fixed as "%s, %pd (nid %llu) ...", thanks for this!

Thanks,
Gao Xiang

> 
> Introduced by commit
> 
>   879d4376533c ("erofs: use %pd instead of messing with ->d_name")
> 
> -- 
> Cheers,
> Stephen Rothwell


