Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27D9C193B43
	for <lists+linux-next@lfdr.de>; Thu, 26 Mar 2020 09:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgCZIrj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 26 Mar 2020 04:47:39 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:47039 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726210AbgCZIrj (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 26 Mar 2020 04:47:39 -0400
Received: by mail-pf1-f196.google.com with SMTP id q3so2415018pff.13;
        Thu, 26 Mar 2020 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=whiWChTFsfnQGZzkK5gxsAgqaOCwfe+IFi0g4TDqkZE=;
        b=A/5OM9YHg5A3e4gJXOFsnHuE4ZBQxA1O8JnzpcNhOnhcLDHPnbSIUHPYmAjpxQvNNa
         3OzAQhmLAAe+CnD5LNxAXoHz8I9WCzZG/695HvuJ4BZQa8MM3dMG8YKV6MTW/ae9L8/I
         Zz6PG4iZphmlej+y8kGyTVHwfdx9fOGbOPEiVpPva3LtrPVxTva0HsSJ4QQjj7FnBhce
         fk3fO2zVVyGZzPVV2Y+WlniuzJyf3rJm62GY4E8mtKnkkrpWZmdKWsnB9zVlsQggJCTE
         JHEAdNamHDw0Hulhs4tqQiY6JcXKNndUF88b30yJvALHFhQsXRyQUuCj8/NZNEO1ja2L
         2CDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=whiWChTFsfnQGZzkK5gxsAgqaOCwfe+IFi0g4TDqkZE=;
        b=JgNLdQqkBqoQx/dbN/8D6LnoArBttDNoqGkhwKp0+a+mOy+h5F9iD/SclldCtUe6MT
         hJHpzAAWqNkDuh2CYePxteVs/QMKBFZPUT5EkCRrjxHYl35P42+hBnL4NdtyUTuyTawn
         9YNIvVIn6WAH44loGA0DZz3DJ53paTc1zu2pGCI9mkOUKNk0IIw9lff33Sclc9Lb0JmO
         iESkR/g3NZXo3jvOnqJmd2i2vuQJcKczN7n6SXEXYCTd1emOjuyUktvg0uysYvH/208X
         yk4G+/VioURyh38P8arz2C8bcrQtw9Y274hEY7+OhNr9r8AfygWWXY2iipz8T7Gxs55S
         MHIA==
X-Gm-Message-State: ANhLgQ1uJNJbpHJBoiYFrtbcV/JiQC11SlCmefLC2na78OvB1JwjFMfV
        /OA2OSBvdDE7UKFRAffzSIgMly6E3Q4d6dhM1anurV+Gdbk=
X-Google-Smtp-Source: ADFU+vug1s5Q4N6TWUCRKkji7YrspUMD8lEQtk0wCt2aPF77oMCeqPUaEfYgB0tUJ34jS7bID8+9oUEFoulOLRYNtfk=
X-Received: by 2002:aa7:8149:: with SMTP id d9mr7709873pfn.170.1585212458493;
 Thu, 26 Mar 2020 01:47:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200326150523.02c4ec48@canb.auug.org.au>
In-Reply-To: <20200326150523.02c4ec48@canb.auug.org.au>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 26 Mar 2020 10:47:26 +0200
Message-ID: <CAHp75VdCf7HRy2BBHw9---p+-eSt0cN1jRaL9D4U_7MpmG5cWw@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drivers-x86 tree with the tip tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Darren Hart <dvhart@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Borislav Petkov <bp@suse.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Mar 26, 2020 at 6:05 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> Today's linux-next merge of the drivers-x86 tree got a conflict in:
>
>   drivers/platform/x86/intel_pmc_core.c
>
> between commit:
>
>   a69b3b1d4cf0 ("platform/x86: Convert to new CPU match macros")
>
> from the tip tree and commit:
>
>   16292bed9c56 ("platform/x86: intel_pmc_core: Add Atom based Jasper Lake (JSL) platform support")
>
> from the drivers-x86 tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>

Looks correct to me, i.e. new macro for code in PDx86.
Thank you, Stephen!

> --
> Cheers,
> Stephen Rothwell
>
> diff --cc drivers/platform/x86/intel_pmc_core.c
> index 3df33ff50faa,d265cd5b1f45..000000000000
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@@ -871,18 -1144,19 +1144,19 @@@ static inline void pmc_core_dbgfs_unreg
>   #endif /* CONFIG_DEBUG_FS */
>
>   static const struct x86_cpu_id intel_pmc_core_ids[] = {
>  -      INTEL_CPU_FAM6(SKYLAKE_L, spt_reg_map),
>  -      INTEL_CPU_FAM6(SKYLAKE, spt_reg_map),
>  -      INTEL_CPU_FAM6(KABYLAKE_L, spt_reg_map),
>  -      INTEL_CPU_FAM6(KABYLAKE, spt_reg_map),
>  -      INTEL_CPU_FAM6(CANNONLAKE_L, cnp_reg_map),
>  -      INTEL_CPU_FAM6(ICELAKE_L, icl_reg_map),
>  -      INTEL_CPU_FAM6(ICELAKE_NNPI, icl_reg_map),
>  -      INTEL_CPU_FAM6(COMETLAKE, cnp_reg_map),
>  -      INTEL_CPU_FAM6(COMETLAKE_L, cnp_reg_map),
>  -      INTEL_CPU_FAM6(TIGERLAKE_L, tgl_reg_map),
>  -      INTEL_CPU_FAM6(TIGERLAKE, tgl_reg_map),
>  -      INTEL_CPU_FAM6(ATOM_TREMONT, tgl_reg_map),
>  -      INTEL_CPU_FAM6(ATOM_TREMONT_L, tgl_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,           &spt_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,             &spt_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,          &spt_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,            &spt_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(CANNONLAKE_L,        &cnp_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_L,           &icl_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(ICELAKE_NNPI,        &icl_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE,           &cnp_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(COMETLAKE_L,         &cnp_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE_L,         &tgl_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(TIGERLAKE,           &tgl_reg_map),
>  +      X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT,        &tgl_reg_map),
> ++      X86_MATCH_INTEL_FAM6_MODEL(ATOM_TREMONT_L,      &tgl_reg_map),
>         {}
>   };
>


-- 
With Best Regards,
Andy Shevchenko
