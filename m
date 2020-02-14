Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3BF15F857
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2020 22:00:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728941AbgBNVAn (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 14 Feb 2020 16:00:43 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46004 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbgBNVAn (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 14 Feb 2020 16:00:43 -0500
Received: by mail-ot1-f65.google.com with SMTP id 59so10440534otp.12
        for <linux-next@vger.kernel.org>; Fri, 14 Feb 2020 13:00:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7DMurB2EcIliipQAm/Fyz3iYQa8JFCY3mjh5m99SUJQ=;
        b=K7T9OJLg4Rd6RuoeGZfJRBGbV7nSZMbJ5Vfkg9phnHv4jBT/9bBmEuX7Ysbb7zSCfq
         2s+cMkr/gk9UaS2jQgaY4MoqrLuxyZxKIBNhGOf2D64qdFVNqOKzpV14sAYT0iHNnM4l
         lyzdxLTmt1uf3N/8m89DK6/febbiFEDywSo/UGz5XRmKsA8ecZHAr6YVgqG/2c8L9Ie2
         lmVDfCT4+tNZ14mSY+CSv1w+C5mhumA18t6gnUWBqmdmA91FK6d6fbiUWXJCtFdm0RNG
         YnUxig7JD1deO+/D/aY8AFrxQmrDEkq5L6qeijk4AHlMztzl8h84OP5LzX5rK/NmK5f/
         fqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7DMurB2EcIliipQAm/Fyz3iYQa8JFCY3mjh5m99SUJQ=;
        b=Bnr0A3HkXHwKSPNTgABZV2iFPMfsGmi/VQX6LjEt6dQRmhynVyUexfJHyzCreqeuY+
         /eGXafOlp6iOTFSNSPcW7DhEGQsHbCVfKfeMFIofySGdJzqePbq//VTh8TCgseydWXnB
         y93GU1eh0nttFJ77b+ofVe+wf/Q36mMc89TiU803irrvb627FOFK355bG95TUXeDldbc
         tJLE2gdHiCFxSvJ6ttNR8Hjrz3opyueiELeOH5jbqwAvGhhWmMAOdHFW02UafJI6Rvjk
         5ydnvhjYLQ7io85xhRibydM3mbmz+OCekjvUDFwZpbwoGq0l1oeKflbVuurDSqJauofV
         Lvag==
X-Gm-Message-State: APjAAAUqjywRlIx/2MDgt5x11LfadW9NV7Oz/TJvqRpSTPTjy2ZvXQKf
        B/yqggHuDx38HjkJsiGmbA2crIhntb2gYGXQycNZOg==
X-Google-Smtp-Source: APXvYqwVLssaKbrmX/2dVzzlIfrCtRMpETQMFACNwFjNeW45I2jNMr2nyglMTtsq4MTz7pBu11KLlg1FFHUUKP9tKjM=
X-Received: by 2002:a9d:2028:: with SMTP id n37mr3941956ota.127.1581714042131;
 Fri, 14 Feb 2020 13:00:42 -0800 (PST)
MIME-Version: 1.0
References: <7ff9e944-1c6c-f7c1-d812-e12817c7a317@oracle.com> <20200214204544.231482-1-almasrymina@google.com>
In-Reply-To: <20200214204544.231482-1-almasrymina@google.com>
From:   Mina Almasry <almasrymina@google.com>
Date:   Fri, 14 Feb 2020 13:00:31 -0800
Message-ID: <CAHS8izMjyLzCsSga59dE+zDC3sLBuA=_u4EtsShN+EZQ1EQitw@mail.gmail.com>
Subject: Re: [PATCH] hugetlb: fix CONFIG_CGROUP_HUGETLB ifdefs
To:     linux-mm@kvack.org, linux-next@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Cc:     David Rientjes <rientjes@google.com>,
        Greg Thelen <gthelen@google.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Shakeel Butt <shakeelb@google.com>,
        Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Feb 14, 2020 at 12:46 PM Mina Almasry <almasrymina@google.com> wrote:
>
> Fixes an #ifdef bug in the patch referred to below that was
> causing a build error when CONFIG_DEBUG_VM &&
> !CONFIG_CCGROUP_HUGETLB.
>
> Fixes: b5f16a533ce8a ("hugetlb: support file_region coalescing again")
> Signed-off-by: Mina Almasry <almasrymina@google.com>
> Cc: David Rientjes <rientjes@google.com>
> Cc: Greg Thelen <gthelen@google.com>
> Cc: Mike Kravetz <mike.kravetz@oracle.com>
> Cc: Shakeel Butt <shakeelb@google.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  mm/hugetlb.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index ee6d262fe6ac0..95d34c58981d2 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -289,7 +289,7 @@ static bool has_same_uncharge_info(struct file_region *rg,
>  #endif
>  }
>
> -#ifdef CONFIG_DEBUG_VM
> +#if defined(CONFIG_DEBUG_VM) && defined(CONFIG_CGROUP_HUGETLB)
>  static void dump_resv_map(struct resv_map *resv)
>  {
>         struct list_head *head = &resv->regions;
> @@ -325,6 +325,10 @@ static void check_coalesce_bug(struct resv_map *resv)
>                 }
>         }
>  }
> +#else
> +static void check_coalesce_bug(struct resv_map *resv)
> +{
> +}
>  #endif
>
>  static void coalesce_file_region(struct resv_map *resv, struct file_region *rg)
> @@ -431,9 +435,7 @@ static long add_reservation_in_range(struct resv_map *resv, long f, long t,
>         }
>
>         VM_BUG_ON(add < 0);
> -#ifdef CONFIG_DEBUG_VM
>         check_coalesce_bug(resv);
> -#endif
>         return add;
>  }
>
> --
> 2.25.0.265.gbab2e86ba0-goog
