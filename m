Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17D011AE7EA
	for <lists+linux-next@lfdr.de>; Fri, 17 Apr 2020 23:57:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728202AbgDQV5k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 17 Apr 2020 17:57:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726638AbgDQV5j (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 17 Apr 2020 17:57:39 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8445AC061A0C
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 14:57:39 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ng8so1657272pjb.2
        for <linux-next@vger.kernel.org>; Fri, 17 Apr 2020 14:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=io/UN1JXNB+HEcTm13hvsulr84T4dV2Cp3jk7Dwqf8w=;
        b=TByZZgyW+KFaEPiOxSH6IERArUktNOCGZ/2ieI4Ry9oOODrenJuvUWFS5wzfPTR8CM
         KbmKwmoIRfPLd7m5tiajYC5sfviULMeJYOzswky+7HA6QknVGwJzCKwhI2owxWIGOuwB
         PemsLsjyNDjb7BTVyrfTntnrJeHq5dEm4Hs9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=io/UN1JXNB+HEcTm13hvsulr84T4dV2Cp3jk7Dwqf8w=;
        b=fXBFuiBJrj5ut39dnqrBVrW+QKQ2VaPIZcsiIPUhpn/hY3sifyWnYz9twDGBUbAggV
         qb7yqlvX/UAZmZhhS+FeSHqqRBjtJVx+HJtMA7VVW67x+f+DLTfOoboChsN33CpOiEJ6
         qzQTjOLnBXI/OSeevBCwgi8aBr7Rqf3lvKtuUn7KenBLU8QblIK4kwYDy+88yBnutGD4
         O4Ke5O9K4+3nePoFpS5BUFB6cbLyoBSYEFmBfRGj6W/qiuA+pAL1Azrg1EM8lnrBzJFk
         qPP1yygdJQ+/WLXKeoSgW/D1qijmu4HSZBWAb/xJd2C3EYu3zMZQkT09T0y2yyLyQqlq
         BpdA==
X-Gm-Message-State: AGi0Pub5EkleXGS24fu6yowJwIRco84+yGFJm+/7XlYoRbvrZJxMElms
        Ki3tXe+wztjKeM8BxH9fEir6BQ==
X-Google-Smtp-Source: APiQypJia1KmBONPSILACsVnB5FgJ7JTFXyAbrGdYsIse/IDGMKLCMp0P0azDMUuZbAMQPCUZ5EgQw==
X-Received: by 2002:a17:90a:d3ca:: with SMTP id d10mr7156503pjw.24.1587160659114;
        Fri, 17 Apr 2020 14:57:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id f6sm6751204pfn.189.2020.04.17.14.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2020 14:57:38 -0700 (PDT)
From:   coverity-bot <keescook@chromium.org>
X-Google-Original-From: coverity-bot <keescook+coverity-bot@chromium.org>
Date:   Fri, 17 Apr 2020 14:57:37 -0700
To:     Josh Poimboeuf <jpoimboe@redhat.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Dmitry Golovin <dima@golovin.in>,
        Peter Zijlstra <peterz@infradead.org>,
        Miroslav Benes <mbenes@suse.cz>, Borislav Petkov <bp@suse.de>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-next@vger.kernel.org
Subject: Coverity: create_orc_entry(): Resource leaks
Message-ID: <202004171457.E65664861F@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello!

This is an experimental semi-automated report about issues detected by
Coverity from a scan of next-20200417 as part of the linux-next scan project:
https://scan.coverity.com/projects/linux-next-weekly-scan

You're getting this email because you were associated with the identified
lines of code (noted below) that were touched by commits:

  Wed Apr 1 13:23:27 2020 -0500
    e81e07244325 ("objtool: Support Clang non-section symbols in ORC generation")

Coverity reported the following:

*** CID 1492654:  Resource leaks  (RESOURCE_LEAK)
/tools/objtool/orc_gen.c: 123 in create_orc_entry()
117     			rela->sym = find_symbol_containing(insn_sec,
118     							   insn_off - 1);
119     		}
120     		if (!rela->sym) {
121     			WARN("missing symbol for insn at offset 0x%lx\n",
122     			     insn_off);
vvv     CID 1492654:  Resource leaks  (RESOURCE_LEAK)
vvv     Variable "rela" going out of scope leaks the storage it points to.
123     			return -1;
124     		}
125
126     		rela->addend = insn_off - rela->sym->offset;
127     	}
128

If this is a false positive, please let us know so we can mark it as
such, or teach the Coverity rules to be smarter. If not, please make
sure fixes get into linux-next. :) For patches fixing this, please
include these lines (but double-check the "Fixes" first):

Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
Addresses-Coverity-ID: 1492654 ("Resource leaks")
Fixes: e81e07244325 ("objtool: Support Clang non-section symbols in ORC generation")

Thanks for your attention!

-- 
Coverity-bot
