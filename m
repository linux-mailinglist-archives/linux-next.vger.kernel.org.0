Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 010A254534D
	for <lists+linux-next@lfdr.de>; Thu,  9 Jun 2022 19:47:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243974AbiFIRru (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 9 Jun 2022 13:47:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245530AbiFIRrr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 9 Jun 2022 13:47:47 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 505872A3066
        for <linux-next@vger.kernel.org>; Thu,  9 Jun 2022 10:47:47 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id e24so22022619pjt.0
        for <linux-next@vger.kernel.org>; Thu, 09 Jun 2022 10:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=b9oolEZCMKFW54fooG59c84yEUWgHZBbtR7AfCAYdYI=;
        b=X41D9Z1M9z11lUWedCO5eNRFRapXlxPrsuECpK13PvOvf2i1VqGFPiimjY6gh8oGqa
         7HbfsPGMpMPCFR49lDG9d9wCISozqdegH3GP7WkRN5d/3FvL7KAKpGG3rneRsYiCASfU
         ch6bjD6f9Nz1TEmXrL5N8RmhaZc9l6PQZdecdH12/5/rLoM5uGhhW3lbKW/DbeL2nM1g
         pfyhzA+c7lyHLYow3MzkHrR8Z262rXzMRhAuzarc7VQQklAckxSTD+KVDXMjlw9y65jM
         uB/nlOgdxjm86dKvsVqxi//096hBdFfWihztJAZ1SDFmxoQuPe+C7eKaEYHialep6Iko
         lXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=b9oolEZCMKFW54fooG59c84yEUWgHZBbtR7AfCAYdYI=;
        b=TzVPKjw2yLwUdfLKXxCbeDwLJUY4wd9RDjLfD9LUMTadEaH9boDxhhM2YJE7ForFZC
         lqy70oDp84lyCA2/LMgSqlDpB/4eujOsuCAHv1N7KLJ3bHGCPvYmHw3ByEW+ON8ilGVC
         +WlP1CyqbaFkqSvDrl7gUJZPlxzqPM0OefyAehApGfS/5dRpZgCuiuNctGPXm2KjHQlk
         u+yQzBDUPmW7k4z7yHuTuIK2aaoD7eKe9UyuUDxvoI/jtTJLDxjczn77zMGgQgHBd2yi
         wBXDI4ZTCv7kl+PtRh7F0meI0uCqh2Q895Lcxmby71Z4jWelXkZKfY6oYDUAlg4BJRQY
         sgUA==
X-Gm-Message-State: AOAM531oXWWz0eJSZtDJG3+Bc20tZ6D0ZSmXFOdcNnvoQrH1cfnLWQny
        4Gsbr8AX6woXL6beft/CdmVJdYemp0PJnBU/mu5APg==
X-Google-Smtp-Source: ABdhPJxLjqCNbzof1vIJhdH5pog7yCXy+y68VQTqER1z0tqe95qssQwKtKqsASY83T43LyDA+aIwt77I/KrM0pJHgEA=
X-Received: by 2002:a17:90b:4a4e:b0:1e6:6757:d085 with SMTP id
 lb14-20020a17090b4a4e00b001e66757d085mr4470182pjb.207.1654796866625; Thu, 09
 Jun 2022 10:47:46 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYv7fESqpGoeKmHoJsst6wfRNMi2wQLGm+PsjbLDuDjdMQ@mail.gmail.com>
 <CA+G9fYsJThWFAxXTbAcJmjshx+oYxVVd+gMM680hS0X1z37+FQ@mail.gmail.com> <YqItYKEIvsw4Yzjx@carbon>
In-Reply-To: <YqItYKEIvsw4Yzjx@carbon>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Thu, 9 Jun 2022 10:47:35 -0700
Message-ID: <CALvZod6ojDd8Bc0VcyFEk-ZrdkFezvQPUvbGg3wyzae+NOp_4A@mail.gmail.com>
Subject: Re: [next] arm64: boot failed - next-20220606
To:     Roman Gushchin <roman.gushchin@linux.dev>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        regressions@lists.linux.dev, lkft-triage@lists.linaro.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-mm <linux-mm@kvack.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Raghuram Thammiraju <raghuram.thammiraju@arm.com>,
        Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
        Vasily Averin <vvs@openvz.org>,
        Qian Cai <quic_qiancai@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, Jun 9, 2022 at 10:27 AM Roman Gushchin <roman.gushchin@linux.dev> wrote:
>
[...]
> +struct mem_cgroup *mem_cgroup_from_obj(void *p)
> +{
> +       struct folio *folio;
> +
> +       if (mem_cgroup_disabled())
> +               return NULL;
> +
> +       if (unlikely(is_vmalloc_addr(p)))
> +               folio = page_folio(vmalloc_to_page(p));

Do we need to check for NULL from vmalloc_to_page(p)?

> +       else
> +               folio = virt_to_folio(p);
> +
> +       return mem_cgroup_from_obj_folio(folio, p);
> +}
