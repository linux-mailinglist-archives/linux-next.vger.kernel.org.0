Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C1CF6E95C6
	for <lists+linux-next@lfdr.de>; Thu, 20 Apr 2023 15:24:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230384AbjDTNYL (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 20 Apr 2023 09:24:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjDTNYK (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 20 Apr 2023 09:24:10 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46B15FC2
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2023 06:24:07 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id m39-20020a05600c3b2700b003f170e75bd3so3441571wms.1
        for <linux-next@vger.kernel.org>; Thu, 20 Apr 2023 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681997046; x=1684589046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKr3OCkPtnlwo4D679qYORJNzK1SaHCeL6+8BxVZa6Q=;
        b=Y+W93ZYbwk4QcGwLm3TGhGhVsMVckKA/JHCeBrx6hhJkT/ylOUEktrsG1w9aTiIrcx
         OeuT85tM+3mRuFgJfe5gHWfblFFcUgnbxaIhlXrEhxJVzzjcKmi2WdRTep2Ly//Wy8oN
         eIDrMbnJKyIJ1uAaVgZnFV0LWsAjP0ZaJh5JrFPsb8ejBJAUOhPDgw/0S+sKoX4Pak7L
         mWA8iaGsDZZBKD+DJHvSzYY738gGPkA+vYjC7ggGPqv6POlviT0FvTZOzvFn5a6NHptE
         BLfAurh7Sa7QhyMynoxOWBYB/3pEotxv/bRM2caY1wLBePN0n5IdOV7jH0kmABgHaoN2
         HFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681997046; x=1684589046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XKr3OCkPtnlwo4D679qYORJNzK1SaHCeL6+8BxVZa6Q=;
        b=fyVQ3HhhzKg7jCdKHEk6qm5FYI0PsDWboVwxJ6t+o0L55JzYzoWx7Nv9OeJb8KMx8M
         nMcAYV0AvIIy8mXljItUw2N3XjNooq/Zt0rFGxnDNIQwUtKXkLBpw7pXqvDr2cV3ml5k
         fLA/QlbOHgfhTsGunUmNleW//mU9QJzHMIMlk4sn7wbphsS5NaXlxi4xsLXU8zaExazA
         f7PPIWuzWmPIKTfnr/1hsvO2AWbw47ISl+Y0IUbNsYcLp0gZMrg2vQyCW9jJapXlJTAN
         NYcocFtbn/wT2u/5oB74l7RO6BSpDn0e3nzywCoGp27iSdVGZDGYhupfgIHZjt/W5+m6
         aPsA==
X-Gm-Message-State: AAQBX9dervbsePnmYEzo150UtRwaxN79BXkZwC3Uu332h2LqKMkgDimH
        31YKLyAcps4ewytO4kJ19d/BFpe8xvdVsXTANw/GQQ==
X-Google-Smtp-Source: AKy350bpym3X1gisQ+UQeRs+P0VBm5STj06n/JUJS1xo7WojJjHx5TRfrqs/6cOPNXzDgBEwr20IPmk+p5PBauF7V/Q=
X-Received: by 2002:a05:600c:2281:b0:3f1:78d0:fc45 with SMTP id
 1-20020a05600c228100b003f178d0fc45mr1279579wmf.28.1681997046188; Thu, 20 Apr
 2023 06:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230420124048.65232-1-broonie@kernel.org>
In-Reply-To: <20230420124048.65232-1-broonie@kernel.org>
From:   Alexandre Ghiti <alexghiti@rivosinc.com>
Date:   Thu, 20 Apr 2023 15:23:55 +0200
Message-ID: <CAHVXubjeMX2Z2jX4kYfXRqb+DiR6-E8PGb+m0MnVN-aTW4hfkQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the risc-v tree with the risc-v-fixes tree
To:     broonie@kernel.org
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul@pwsan.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Palmer Dabbelt <palmer@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi,

On Thu, Apr 20, 2023 at 2:40=E2=80=AFPM <broonie@kernel.org> wrote:
>
> Hi all,
>
> Today's linux-next merge of the risc-v tree got a conflict in:
>
>   arch/riscv/mm/init.c
>
> between commit:
>
>   ef69d2559fe91 ("riscv: Move early dtb mapping into the fixmap region")
>
> from the risc-v-fixes tree and commits:
>
>   8589e346bbb67 ("riscv: Move the linear mapping creation in its own func=
tion")
>   3335068f87217 ("riscv: Use PUD/P4D/PGD pages for the linear mapping")
>
> from the risc-v tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc arch/riscv/mm/init.c
> index 0f14f4a8d179a,7bd66795165da..0000000000000
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@@ -1070,26 -1112,36 +1092,47 @@@ asmlinkage void __init setup_vm(uintpt=
r
>         pt_ops_set_fixmap();
>   }
>
> - static void __init setup_vm_final(void)
> + static void __init create_linear_mapping_range(phys_addr_t start,
> +                                              phys_addr_t end)
>   {
> +       phys_addr_t pa;
>         uintptr_t va, map_size;
> -       phys_addr_t pa, start, end;
> -       u64 i;
>
> -       /* Setup swapper PGD for fixmap */
>  +#if !defined(CONFIG_64BIT)
>  +      /*
>  +       * In 32-bit, the device tree lies in a pgd entry, so it must be =
copied
>  +       * directly in swapper_pg_dir in addition to the pgd entry that p=
oints
>  +       * to fixmap_pte.
>  +       */
>  +      unsigned long idx =3D pgd_index(__fix_to_virt(FIX_FDT));
>  +
>  +      set_pgd(&swapper_pg_dir[idx], early_pg_dir[idx]);
>  +#endif

This does not look correct, fixmap setup should not be in
create_linear_mapping_range() function.
Please find below the diff I would apply:

diff --cc arch/riscv/mm/init.c
index 0f14f4a8d179,7bd66795165d..a19146ab9341
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@@ -1070,23 -1112,63 +1092,74 @@@ asmlinkage void __init setup_vm(uintptr
        pt_ops_set_fixmap();
  }

- static void __init setup_vm_final(void)
+ static void __init create_linear_mapping_range(phys_addr_t start,
+                                              phys_addr_t end)
  {
+       phys_addr_t pa;
        uintptr_t va, map_size;
-       phys_addr_t pa, start, end;
+
+       for (pa =3D start; pa < end; pa +=3D map_size) {
+               va =3D (uintptr_t)__va(pa);
+               map_size =3D best_map_size(pa, end - pa);
+
+               create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
+                                  pgprot_from_va(va));
+       }
+ }
+
+ static void __init create_linear_mapping_page_table(void)
+ {
+       phys_addr_t start, end;
        u64 i;

+ #ifdef CONFIG_STRICT_KERNEL_RWX
+       phys_addr_t ktext_start =3D __pa_symbol(_start);
+       phys_addr_t ktext_size =3D __init_data_begin - _start;
+       phys_addr_t krodata_start =3D __pa_symbol(__start_rodata);
+       phys_addr_t krodata_size =3D _data - __start_rodata;
+
+       /* Isolate kernel text and rodata so they don't get mapped with a P=
UD */
+       memblock_mark_nomap(ktext_start,  ktext_size);
+       memblock_mark_nomap(krodata_start, krodata_size);
+ #endif
+
+       /* Map all memory banks in the linear mapping */
+       for_each_mem_range(i, &start, &end) {
+               if (start >=3D end)
+                       break;
+               if (start <=3D __pa(PAGE_OFFSET) &&
+                   __pa(PAGE_OFFSET) < end)
+                       start =3D __pa(PAGE_OFFSET);
+               if (end >=3D __pa(PAGE_OFFSET) + memory_limit)
+                       end =3D __pa(PAGE_OFFSET) + memory_limit;
+
+               create_linear_mapping_range(start, end);
+       }
+
+ #ifdef CONFIG_STRICT_KERNEL_RWX
+       create_linear_mapping_range(ktext_start, ktext_start + ktext_size);
+       create_linear_mapping_range(krodata_start,
+                                   krodata_start + krodata_size);
+
+       memblock_clear_nomap(ktext_start,  ktext_size);
+       memblock_clear_nomap(krodata_start, krodata_size);
+ #endif
+ }
+
+ static void __init setup_vm_final(void)
+ {
        /* Setup swapper PGD for fixmap */
 +#if !defined(CONFIG_64BIT)
 +      /*
 +       * In 32-bit, the device tree lies in a pgd entry, so it must be co=
pied
 +       * directly in swapper_pg_dir in addition to the pgd entry that poi=
nts
 +       * to fixmap_pte.
 +       */
 +      unsigned long idx =3D pgd_index(__fix_to_virt(FIX_FDT));
 +
 +      set_pgd(&swapper_pg_dir[idx], early_pg_dir[idx]);
 +#endif
++
        create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
                           __pa_symbol(fixmap_pgd_next),
                           PGDIR_SIZE, PAGE_TABLE);

> -       create_pgd_mapping(swapper_pg_dir, FIXADDR_START,
> -                          __pa_symbol(fixmap_pgd_next),
> -                          PGDIR_SIZE, PAGE_TABLE);
> ++
> +       for (pa =3D start; pa < end; pa +=3D map_size) {
> +               va =3D (uintptr_t)__va(pa);
> +               map_size =3D best_map_size(pa, end - pa);
> +
> +               create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
> +                                  pgprot_from_va(va));
> +       }
> + }
> +
> + static void __init create_linear_mapping_page_table(void)
> + {
> +       phys_addr_t start, end;
> +       u64 i;
> +
> + #ifdef CONFIG_STRICT_KERNEL_RWX
> +       phys_addr_t ktext_start =3D __pa_symbol(_start);
> +       phys_addr_t ktext_size =3D __init_data_begin - _start;
> +       phys_addr_t krodata_start =3D __pa_symbol(__start_rodata);
> +       phys_addr_t krodata_size =3D _data - __start_rodata;
> +
> +       /* Isolate kernel text and rodata so they don't get mapped with a=
 PUD */
> +       memblock_mark_nomap(ktext_start,  ktext_size);
> +       memblock_mark_nomap(krodata_start, krodata_size);
> + #endif
>
>         /* Map all memory banks in the linear mapping */
>         for_each_mem_range(i, &start, &end) {

Thanks!

Alex
