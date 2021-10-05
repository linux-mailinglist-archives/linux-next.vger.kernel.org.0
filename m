Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E15CE422A13
	for <lists+linux-next@lfdr.de>; Tue,  5 Oct 2021 16:05:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235301AbhJEOHq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 5 Oct 2021 10:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235063AbhJEOHo (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 5 Oct 2021 10:07:44 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1177AC061A52
        for <linux-next@vger.kernel.org>; Tue,  5 Oct 2021 07:00:58 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id b8so44421145edk.2
        for <linux-next@vger.kernel.org>; Tue, 05 Oct 2021 07:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aSourPOIwSX7kx4jyt8e85SDL0DvMZa6V01c8HSKy7s=;
        b=ShpvYaiHSDEent9VqRSGe92DSbd2o849TMh57/SY9s7UL0W7S7nCkcTLk5Gws8n2qi
         cfy0duEhDL0KmuXrgNCWIePf95/Q8XmSlnqj3yFg6qJoXMjTDSgeBp5P8gCUZLVNaJm7
         79SVyHrRJoT9j/VKPXLk/GGsYRJUY59Dn2YDqxz0nGcw7iDt+9cxGinQub7uQsYkfUFS
         iDlkZsyJ5NzA6zpf7cvHUUMf96puZNaw9Bte+xas3N4kaFyixhX1KpJ6WxH4jmuE+YZR
         3/3sIXkO5ja36pr3VWzlOfS/VdlQM4yF/gmeVTgsUJzUJzS5kdDw/fopYfhxlCwOIVAb
         IsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aSourPOIwSX7kx4jyt8e85SDL0DvMZa6V01c8HSKy7s=;
        b=JTQ5AVwsDI83lOEXbny8K4WlvU1GilqiK53y4YcPqwOehTyEUXQVTRn9PYHtziA2+0
         J5XXM3aaTrQgzI00y/rNh2GqtYqNoZ4NyUbmz+QtYRgu4KGkPgfg9OsUlQvnCzlh0UNW
         UWUXb0llvQxEUA4pEpdQdsjPt+6LlalpvuG3xfQYo1umawAw6/bhHtR2s4WXCQwegPJA
         RqXMlchGqW1DK8hCWk3PWqXF6/PRU4sHF2Q33gGLLtJIODHSCxHnmea5MS3l/F+Uby8E
         Z8XXhBbd3HxfKNLxUNPhUmDZ0ZIJfvtSHu2+R8/LJ0k5oNhRYSc6NFryw0l517OYocum
         +3sQ==
X-Gm-Message-State: AOAM530PEt/3ZIWoGY51UpBVV+A1bpHJMccQ8b5gWSdI0A//vsmIQDzG
        ax4DqpDiEsbIz3n4ZuywAVePM0b7aGyx6szxq158cPkCsA==
X-Google-Smtp-Source: ABdhPJzBSrn0DuVEY5bG4zQToeS/yKCGqXINeTqa9cNEui6CKXw/P7dsZycHt+cj+jNWxIvuvGOwRbZg6y3n+0Wv3v4=
X-Received: by 2002:a17:906:3d22:: with SMTP id l2mr9820580ejf.187.1633442345839;
 Tue, 05 Oct 2021 06:59:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211005141934.705eaa1c@canb.auug.org.au>
In-Reply-To: <20211005141934.705eaa1c@canb.auug.org.au>
From:   Paul Moore <paul@paul-moore.com>
Date:   Tue, 5 Oct 2021 09:58:55 -0400
Message-ID: <CAHC9VhQxddE8b3F1giSXXWhY+YVrKh0HHtpe9KipSPYUMn8U=Q@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the selinux tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Richard Guy Briggs <rgb@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Oct 4, 2021 at 11:19 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the audit tree got a conflict in:
>
>   include/uapi/linux/audit.h
>
> between commit:
>
>   5bd2182d58e9 ("audit,io_uring,io-wq: add some basic audit support to io_uring")
>
> from the selinux tree and commit:
>
>   571e5c0efcb2 ("audit: add OPENAT2 record to list "how" info")
>
> from the audit tree.

Thanks Stephen, your fix below is correct and I'll make sure to
mention this to Linus when sending the SELinux and audit trees to him
during the next merge window.

> diff --cc include/uapi/linux/audit.h
> index ecf1edd2affa,afa2472ad5d6..000000000000
> --- a/include/uapi/linux/audit.h
> +++ b/include/uapi/linux/audit.h
> @@@ -118,7 -118,7 +118,8 @@@
>   #define AUDIT_TIME_ADJNTPVAL  1333    /* NTP value adjustment */
>   #define AUDIT_BPF             1334    /* BPF subsystem */
>   #define AUDIT_EVENT_LISTENER  1335    /* Task joined multicast read socket */
>  +#define AUDIT_URINGOP         1336    /* io_uring operation */
> + #define AUDIT_OPENAT2         1337    /* Record showing openat2 how args */
>
>   #define AUDIT_AVC             1400    /* SE Linux avc denial or grant */
>   #define AUDIT_SELINUX_ERR     1401    /* Internal SE Linux Errors */

-- 
paul moore
www.paul-moore.com
