Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBB5734BFC2
	for <lists+linux-next@lfdr.de>; Mon, 29 Mar 2021 01:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhC1XVD (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 28 Mar 2021 19:21:03 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:42030 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhC1XUr (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 28 Mar 2021 19:20:47 -0400
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 12SNKTcH017572;
        Mon, 29 Mar 2021 08:20:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 12SNKTcH017572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1616973630;
        bh=ItLQfUsGcicmS+avIkHvhLhPk6woNXSdDKen4o04hPk=;
        h=From:Date:Subject:To:Cc:From;
        b=jAMlMJOpQkuvQFBy3wMgf0ubrXC7YUhUERhaVEWHMkMjiLOPyqMZgStYOR99XjjCp
         B9mTc/6Gwd+6dtp3u6vtVupKyP8Rg8ZM1eY+V0w0mxzOibHKCJyxaL1xbVjT0hGRiP
         oDDXlseRNomsehsLseE0g/xD2TVMQoDWBJLn+hp7DixxPlARksP7PfGmBWVV/CjVoV
         XXm9tEqFnynU2wLPBE0TslKC9xReGkiH/LznkTKCXcP6/dzl4bnasLCDK/jTqotimp
         hNS8DcWYb1bAypkDZbGhuKEDay9oMBKrYGkfRlZ3u9vb1saGy0hP8IjNzn7ZTo8vlP
         iugoHO0skraAg==
X-Nifty-SrcIP: [209.85.214.171]
Received: by mail-pl1-f171.google.com with SMTP id g10so3525419plt.8;
        Sun, 28 Mar 2021 16:20:30 -0700 (PDT)
X-Gm-Message-State: AOAM531zxQkxGY1pPAVyjWYF8R8KJJY8nBaUtWYinwrAkFLW/VsTsN1q
        zLK9KX5nK8FNcowCGyOlYHHI/8NLivIyPtU1q0E=
X-Google-Smtp-Source: ABdhPJwd7Y+jnz77PvsHPnzJ3UUBSwQTUnaJNg4/nQZsqBwrXLzAdhV0c1RXjxEvoMEVDH3bHwM8vn9lHbggZjYNalE=
X-Received: by 2002:a17:902:8ec9:b029:e6:c5e:cf18 with SMTP id
 x9-20020a1709028ec9b02900e60c5ecf18mr25837415plo.47.1616973629290; Sun, 28
 Mar 2021 16:20:29 -0700 (PDT)
MIME-Version: 1.0
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 29 Mar 2021 08:19:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQUeQ1jrrWKszxU98NRM1QNDdTL+aT3znYut-ZKnEsUBw@mail.gmail.com>
Message-ID: <CAK7LNAQUeQ1jrrWKszxU98NRM1QNDdTL+aT3znYut-ZKnEsUBw@mail.gmail.com>
Subject: Kbuild fix for today's linux-next
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

I noticed Clang build breakage for kbuild/for-next.

Please apply the following, or use the old branch
for kbuild tree.

Thanks.




diff --git a/scripts/as-version.sh b/scripts/as-version.sh
index 11f1e7b24bff..8b9410e329df 100755
--- a/scripts/as-version.sh
+++ b/scripts/as-version.sh
@@ -45,7 +45,7 @@ orig_args="$@"
 # Get the first line of the --version output.
 IFS='
 '
-set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler /dev/null -o
/dev/null 2>&1)
+set -- $(LC_ALL=C "$@" -Wa,--version -c -x assembler /dev/null -o
/dev/null 2>/dev/null)

 # Split the line on spaces.
 IFS=' '


-- 
Best Regards
Masahiro Yamada
