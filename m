Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 826C43F26CD
	for <lists+linux-next@lfdr.de>; Fri, 20 Aug 2021 08:31:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238294AbhHTGcT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Aug 2021 02:32:19 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:28422 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235390AbhHTGcT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Aug 2021 02:32:19 -0400
X-Greylist: delayed 437 seconds by postgrey-1.27 at vger.kernel.org; Fri, 20 Aug 2021 02:32:18 EDT
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 17K6VRXq012217;
        Fri, 20 Aug 2021 15:31:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 17K6VRXq012217
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629441087;
        bh=TojktwP6N8rx3aEpHXABD9Q2v3NaByV5fctRNxyQ1lM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=oQwLhsWbCTPQ3ZOJH7U9xuACDZvRFg+jpKSNwuwgSesk3b6LUwbcuDMXGY0rjTePc
         XFbYiinKguYIyw0USOXBcnfXJqi208c8NNJ+34mdExiv1ZP/2Dgo358SwX+vioyhqB
         I5dF4F8zUcrWHz74sPdr91fmCwP+UqtePkCsHitdmbIRmw2eM7mepW2dv3opGqdSkl
         ya4ELonjFPg1KB0Cc904zSC9GGm0Hq+4ePGWnA6w4SVLM4DiB593E5QAN0lteAwFPa
         82P69aqWejzoTodA2kOAof0ZbY8fRPrUaSqARaqGmQ1vkgmVZvqm6U+HRUmi2SPbkp
         rOkUOsZXrXLRA==
X-Nifty-SrcIP: [209.85.214.182]
Received: by mail-pl1-f182.google.com with SMTP id j2so982856pll.1;
        Thu, 19 Aug 2021 23:31:27 -0700 (PDT)
X-Gm-Message-State: AOAM533cIN8+YQt1PfNmMGUZG0cmBYhO5POqSaE8sfOxkmv9J8LGWMnQ
        Od5S83xBxz/PlXlSzXzICK3C708vjOyKK3Nc4oE=
X-Google-Smtp-Source: ABdhPJxm1c+K8hJI3yOQe8W1swKjLIcrowW4t+e6n93MsGMM7cZCPfXqhfw9XxoWs2MrtgGFdjYlReXCVk4zYGZecvs=
X-Received: by 2002:a17:90a:ea87:: with SMTP id h7mr3035645pjz.198.1629441086554;
 Thu, 19 Aug 2021 23:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210820161445.6eadab0c@canb.auug.org.au>
In-Reply-To: <20210820161445.6eadab0c@canb.auug.org.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 20 Aug 2021 15:30:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNASpcXLdQXdYErgYu1dCJWpw4qNGxqg8SxP1RzGi-Y5JBQ@mail.gmail.com>
Message-ID: <CAK7LNASpcXLdQXdYErgYu1dCJWpw4qNGxqg8SxP1RzGi-Y5JBQ@mail.gmail.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     James Bottomley <James.Bottomley@hansenpartnership.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Aug 20, 2021 at 3:14 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi all,
>
> After merging the scsi tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
>
> drivers/scsi/Makefile:197: FORCE prerequisite is missing
>
> Exposed by commit
>
>   0fc7db58e2a6 ("kbuild: warn if FORCE is missing for if_changed(_dep,_rule) and filechk")
>
> I don't know why this warning only appeared after the merge of the scsi
> tree, since the offending line has been in this Makefile since 2017

You are doing incremental builds.

Presumably, because include/scsi/scsi_devinfo.h
is touched by the following commit in the scsi tree.

commit f591a2e0548da88130c7b1c79f1f735273adc683
Author: Martin Kepplinger <martink@posteo.de>
Date:   Sun Jul 4 09:54:01 2021 +0200


Kbuild rebuilds scsi_devinfo_tbl.o due to the
timestamp update, then displays the warning.



If the scsi maintainers want to fix this issue,
a patch is already there.

https://lore.kernel.org/patchwork/patch/1478797/

Since this is a bug, it can get in the scsi tree
any time.





-- 
Best Regards
Masahiro Yamada
