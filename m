Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79FF844CCE5
	for <lists+linux-next@lfdr.de>; Wed, 10 Nov 2021 23:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233558AbhKJWfK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 10 Nov 2021 17:35:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbhKJWfK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 10 Nov 2021 17:35:10 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB17C061767;
        Wed, 10 Nov 2021 14:32:22 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id t11so8160747ljh.6;
        Wed, 10 Nov 2021 14:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rg/Hge5syR4s3WTaka8d1F2LrCctSfO9o0lxQ0YuX6Y=;
        b=haG3yjZvXmcEKTwKd7bAjso/aTGXm1PMFeKN702tvQdrKSO4xARhS0dXe1fdYQknJG
         jDTHvR8OoFEbUGpAvKWXqVrP/XhFs4EJAz7QAJirMdWidyu+e7jwEU3SA1Q2EkYuz/H8
         wPugi9F1CQRlyJdgZcMjuPBqHKJ7eM8XosUthsDlIcrWdOYlxtcW7gPDRJLMQ3dasIV5
         ukRsbjFYY51j1Ib4/32+cyT1g34NS2SltkP5m4mtdULvEuJnoTKGmrp2GBITNvvv26Y+
         PfQDMAgD0ES4i8YQ14u/fkqcbGA1B3eQ2ED5XFAlQXV2tKnxcKOtfbtMCUYpJ38j1taI
         jNSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rg/Hge5syR4s3WTaka8d1F2LrCctSfO9o0lxQ0YuX6Y=;
        b=uXpDkSKkYfXlUp6G3KelWq1owIuuuGI434920Upavk1zxjlI6994AxUqX/S6rHoCNc
         fjp8+Io6qwRQF5X0al6MwsgT9WRXkNP2z0PJ+nYNAoz0VKaaJd6GEXxVN9J31t6Fxpte
         /HDuas/MHu8mi4PvY8o1Em3BCHoh9BenNZHMwIwyqEB1v2oYLfkOL8grbRueZLvz9qwH
         e2JZzgRBlB2iAWVH7JLUxLbH1gZhminX5pZ3WOYtDYTT6/rCf1Ehvk4tQn5+kPq7vynE
         gI/ZAGxmgTahf/2hZj2aY+sVZIQZh90DC3D5TsCIR34qXXFSBUocW4ErKefV5umoSRCz
         hDOg==
X-Gm-Message-State: AOAM5324wmAAj1f2brFjV7CW7AQDqkdXZOwyN0Qp+pZIBL19T88hQuCp
        bAIOZdUD7Oek61WzNUn3uPKB2T8ckS0axe1Ln08=
X-Google-Smtp-Source: ABdhPJx6Ti/YQFyAw67QKVHgWO/EJiIobthutrJfGSf8fDbMnbb3L+QEKnr8oxwnBIAPVjUZqhXtsVGUAGaGe5JOkzU=
X-Received: by 2002:a2e:9107:: with SMTP id m7mr2365756ljg.209.1636583540395;
 Wed, 10 Nov 2021 14:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20211111085746.46746d4f@canb.auug.org.au>
In-Reply-To: <20211111085746.46746d4f@canb.auug.org.au>
From:   Steve French <smfrench@gmail.com>
Date:   Wed, 10 Nov 2021 16:32:09 -0600
Message-ID: <CAH2r5msHBRrU+E1__oxQ=qojrjHsmQtf-z-eu2GcnSjeOZCYZg@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the cifs tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     CIFS <linux-cifs@vger.kernel.org>,
        "Paulo Alcantara (SUSE)" <pc@cjr.nz>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I had a cut-n-paste error in updating one of Paulo's patches this
morning.  Fixed now in cifs-2.6.git for-next

On Wed, Nov 10, 2021 at 3:57 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the cifs tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
>
> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented [-Wcpp]
> fs/cifs/connect.c: In function 'clean_demultiplex_info':
> fs/cifs/connect.c:841:2: error: stray '#' in program
>   841 | +#ifdef CONFIG_CIFS_DFS_UPCALL
>       |  ^
> fs/cifs/connect.c:841:3: error: 'ifdef' undeclared (first use in this function)
>   841 | +#ifdef CONFIG_CIFS_DFS_UPCALL
>       |   ^~~~~
> fs/cifs/connect.c:841:3: note: each undeclared identifier is reported only once for each function it appears in
> fs/cifs/connect.c:841:8: error: expected ';' before 'CONFIG_CIFS_DFS_UPCALL'
>   841 | +#ifdef CONFIG_CIFS_DFS_UPCALL
>       |        ^~~~~~~~~~~~~~~~~~~~~~~
>       |        ;
> fs/cifs/connect.c:843:15: error: 'struct TCP_Server_Info' has no member named 'leaf_fullpath'
>   843 | + kfree(server->leaf_fullpath);
>       |               ^~
> fs/cifs/connect.c:844:2: error: stray '#' in program
>   844 | +#endif
>       |  ^
> fs/cifs/connect.c:844:3: error: 'endif' undeclared (first use in this function); did you mean 'gendisk'?
>   844 | +#endif
>       |   ^~~~~
>       |   gendisk
> fs/cifs/connect.c:844:8: error: expected ';' before 'kfree'
>   844 | +#endif
>       |        ^
>       |        ;
>   845 |  kfree(server);
>       |  ~~~~~
>
> Caused by commit
>
>   58b90aa95977 ("cifs: support nested dfs links over reconnect")
>
> I have used the cifs tree from next-20211110 for today.
>
> --
> Cheers,
> Stephen Rothwell



-- 
Thanks,

Steve
