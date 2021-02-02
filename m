Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C778730C018
	for <lists+linux-next@lfdr.de>; Tue,  2 Feb 2021 14:50:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232810AbhBBNtS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 2 Feb 2021 08:49:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232392AbhBBNrS (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 2 Feb 2021 08:47:18 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09A7C06174A
        for <linux-next@vger.kernel.org>; Tue,  2 Feb 2021 05:46:36 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id d2so2393831pjs.4
        for <linux-next@vger.kernel.org>; Tue, 02 Feb 2021 05:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iLL+1a4yP04vUjj0GQ0pbl4fWgpHVkitH336W65VCZQ=;
        b=sajn6ytpW/JYMckv7EnjJ9MhBH0wjHLcE0ezGuDiXeITJ9JE5uiBMUXl+5pqpbcNby
         wpIZCEYOYU9nFUIv62yxCjZAzLSBPO/cJQiA3MHxN8sGdziKzN8QXU8vN0O2vZiHCCKH
         7YuVXBj60kNOxjFO+b0Bsu+GCqEfLaXZwOY3TX+JU3gEFfOZZVFh7SobMlegnaI3bp3n
         5MBIhOnuQ+tzdWbWX+yNRkhRteQcyoJ1uK2c7Kb1oqMmOd04KGnPEPiXbSBMo1i5UjfF
         M7HrtR7QSC977DC3ClvlDEYh4/BZHgJbJSwLbE6CTexqJPIsDQR12WtDAWNt9FnqvHew
         zDDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iLL+1a4yP04vUjj0GQ0pbl4fWgpHVkitH336W65VCZQ=;
        b=CIzoGwzdX8ruN1/RhS9B3Czam40YQTVyKhrzjzPUzt1ALoraRoHTDUmrARwT56dv8D
         fUiic9R1NCl7lQ+TrrrcnD1cncHYq6hADR1gRy6YPpQqxNFaPZGfoCuBsIIenRiHW3rY
         Uawf9qePv1XSHVbexAdQKAUviPxvHDJpW31J7vZcmFi/+Ih9rVUuqOpufDHl7EZdtrgZ
         SCMIRRIz60+59WPX5nyWo3Jzd0J9dEMhVzrkSwLVqF6gAwukBjDbpHQ0Ysg99ziUaqck
         IYERBK08RjA+dBHhPr1mbgRKOItoCqSJTKnP7MnRpqdFkVNHA4psKxhWJj7wRVMB5mgR
         KkkQ==
X-Gm-Message-State: AOAM530ND0a2IHuZw9IQMHbdIeX94mxrAzcwvzGJzsuU4J59Rkm84zfr
        WXz3IRmSDRs0OKS7tklk4ca995fiTcJHBx+SEWVIvQ==
X-Google-Smtp-Source: ABdhPJyPpeB6KFRTGQacJqDyb9jScAy/k0sUSg1D85NpviPJXsRur24JklKSynyWrFt01HnxOHs36rfRYVk02/QemJg=
X-Received: by 2002:a17:902:8695:b029:e1:6152:c76e with SMTP id
 g21-20020a1709028695b02900e16152c76emr9198937plo.13.1612273596174; Tue, 02
 Feb 2021 05:46:36 -0800 (PST)
MIME-Version: 1.0
References: <CADYN=9Ljjx6GRPk45jkY1N7dVDOFFjMB8yy5QRzVE-1tzEnUjw@mail.gmail.com>
In-Reply-To: <CADYN=9Ljjx6GRPk45jkY1N7dVDOFFjMB8yy5QRzVE-1tzEnUjw@mail.gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Tue, 2 Feb 2021 14:46:24 +0100
Message-ID: <CAAeHK+yUm_LAe54mBwFrjVwcSpLrxYHZFzDorUvFvRNsP7fjaA@mail.gmail.com>
Subject: Re: arch/arm64/kernel/mte.c:121:15: error: 'mte_enable_kernel_sync'
 undeclared here (not in a function); did you mean 'mte_enable_kernel'?
To:     Anders Roxell <anders.roxell@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        lkft-triage@lists.linaro.org,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 2, 2021 at 11:09 AM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> Hi,
>
> I've seen this failure on tag next-20210202:
> arch/arm64/kernel/mte.c:121:15: error: 'mte_enable_kernel_sync'
> undeclared here (not in a function); did you mean 'mte_enable_kernel'?
>
> I think it may be a merge conflict that didn't get resolved correctly?

Yes, that patch was supposed to go on top of another one (which
actually renames mte_enable_kernel to mte_enable_kernel_sync), but the
latter wasn't picked up into mm.

> The below change fixed the issue:
>
> diff --git a/arch/arm64/kernel/mte.c b/arch/arm64/kernel/mte.c
> index 275b5d0f38b8..8f5bd1293496 100644
> --- a/arch/arm64/kernel/mte.c
> +++ b/arch/arm64/kernel/mte.c
> @@ -118,7 +118,7 @@ void mte_set_report_once(bool state)
>  {
>   WRITE_ONCE(report_fault_once, state);
>  }
> -EXPORT_SYMBOL(mte_enable_kernel_sync);
> +EXPORT_SYMBOL(mte_enable_kernel);
>  EXPORT_SYMBOL(mte_set_report_once);
>
>  bool mte_report_once(void)

The changed export also needs to be moved next to mte_enable_kernel().

Thanks!
