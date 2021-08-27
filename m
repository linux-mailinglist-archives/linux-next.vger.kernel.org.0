Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00233F9B82
	for <lists+linux-next@lfdr.de>; Fri, 27 Aug 2021 17:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245400AbhH0POT (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 27 Aug 2021 11:14:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233587AbhH0POT (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 27 Aug 2021 11:14:19 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ABF3C061757
        for <linux-next@vger.kernel.org>; Fri, 27 Aug 2021 08:13:30 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id n12so4114731plk.10
        for <linux-next@vger.kernel.org>; Fri, 27 Aug 2021 08:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wNcmjrgT+pU+GmhhBaKch+j5CYTuccBi6r9ayZ8AZ60=;
        b=U5tDJ9/RQAYnU3F2ma/wk72GTxi+fHt4hEeoQs1qIN7ZMPEy6HulJhciZk7evjIZMQ
         07nV6skA9QSQm6MNgm2WVLQY459u5PNlqtEl+huRZXXpGb5c6nwQUm2nwy7vSsCO/bHG
         A1BRNOEK+ZHGUhRPBIXH0sVgLlmEJQJTJYOEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wNcmjrgT+pU+GmhhBaKch+j5CYTuccBi6r9ayZ8AZ60=;
        b=p9i8fzIVV21ZrURYLFbB4d1Yzzwyt2C0qAava5lyLK2EoAyRdb1l8xKn2HlFyTV4r2
         +4YfJdAB92+Uha/bFSjAHZb2gUOpKQutccharseFiVhTYQgeeU0ZqoVeWIcmQ8CV6okM
         GcdWiMD0E2q4I+LjSN9CF8+EWuPQGchDWmMfzDI9QYbsO43cN5xbRnywXOxpVfINvrDO
         TEs6tRZw348LwO4SLyrbQlsd0RCb+Ez+ksIiA5eD3Eak2Pn+vcMEjfVneJSPbbKHmXZn
         PNh1O3sx/mDLU02/0jlR9FrFEtXyMUj5k8lfA45XkeILAsdNfA26e0OKF+1aPEhfLGb6
         ED1w==
X-Gm-Message-State: AOAM531XkckHFPw+A3Cx9CIPlTHXfXIpg6vzj/o5OtfZwM8406gUX0Pw
        rCNrjFqLs5HvJuWcojlFqh933w==
X-Google-Smtp-Source: ABdhPJxUcgLEHFsn0Yuu8AZiBkgBaBNil2cWE6ZrY4Cs5N+rhLI+1oVhHNCz0OBHaTIn7V/pSHXTig==
X-Received: by 2002:a17:90a:2ec6:: with SMTP id h6mr23348104pjs.79.1630077209688;
        Fri, 27 Aug 2021 08:13:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 188sm2699820pfz.193.2021.08.27.08.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 08:13:29 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Kees Cook <keescook@chromium.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH] Compiler Attributes: Add __alloc_size for better bounds checking fix
Date:   Fri, 27 Aug 2021 08:13:27 -0700
Message-Id: <20210827151327.2729736-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; h=from:subject; bh=bQiqqUs8UgNqYHyn8tJ+VrFYud+KD23pl32jsqxD5V0=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhKQEW1o69iAiX3Ex2Z+uUHJT1dh2Os0spjaIJ2W7I YuuIJpaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYSkBFgAKCRCJcvTf3G3AJh1FD/ 4oSWVyoj7gFVEqWWWp8f2YNTe2Yhq/m+pdF2Y3qfMOgCpl2x+LKls5kQAW0pHx9aQOzNlJzEVq79Xm n5keqN3S2zsBThMt82K4Fe1egwVB8mg80nW2VzNHPG9+C9MexwMM+as2KBe6zbXmDd3QWFgBXFnyFJ whENJz/bd0ZmyuHKUQVD0FGWmBex8MoSC1x3WWVVM9+UlqKzahi+0QSYZJNOMKyHzsbFGDae5bpAeV kCaXOD/omaROpKxuavMYfMvDQqbVJE0FFOtZBMs30IbATeqfYcubirJV+2Blz81i4djZSBSRjAmSzW mVSwqizQl3Toe6fogXeR3qENg7+X4myHbeip3NRBGo0t2q5d5tJq8XLIqv5+ua9ZF59dn9XghG82Yi glRfSW9R59f1PkD8pFtuHjTDW/oL+S6Ma9umbymMDMxfTawLImJUbabTBF/c4DHCNqz2u4n+R8/edJ I8/Z3ZDopJNF0+ZJbCn/+CGIXCiWCHOvM7ECcAUo4YthtFIfUCLyH/4zfAllLbCtok6Ta61Lrv/WX0 RxoK3s1wybRavDYnbhEkt/usspwZtJqMJ9c8cluBMAOGXdrgW4qJB5eVH8QAGZvSVTaiELCyD+V0ma Dtb20IJyw9O2O3TdSt6nZSe4PKF5bxINnb+jp4t3dyw77/fAGgQzaUUeJpEg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Adjust the warning logic to deal with pre-9.1 gcc behaviors.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
Hi Andrew, this is meant to replace:
compiler-attributes-add-__alloc_size-for-better-bounds-checking-fix.patch
Thanks!
---
 Makefile | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 41ed29b5af2b..141a851930e6 100644
--- a/Makefile
+++ b/Makefile
@@ -1096,8 +1096,17 @@ endif
 
 ifdef CONFIG_CC_IS_GCC
 # The allocators already balk at large sizes, so silence the compiler
-# warnings for bounds checks involving those possible values.
-KBUILD_CFLAGS += -Wno-alloc-size-larger-than
+# warnings for bounds checks involving those possible values. While
+# -Wno-alloc-size-larger-than would normally be used here, earlier versions
+# of gcc (<9.1) weirdly don't handle the option correctly when _other_
+# warnings are produced (?!). Using -Walloc-size-larger-than=SIZE_MAX
+# doesn't work (as it is documented to), silently resolving to "0" prior to
+# version 9.1 (and producing an error more recently). Numeric values larger
+# than PTRDIFF_MAX also don't work prior to version 9.1, which are silently
+# ignored, continuing to default to PTRDIFF_MAX. So, left with no other
+# choice, we must perform a versioned check to disable this warning.
+# https://lore.kernel.org/lkml/20210824115859.187f272f@canb.auug.org.au
+KBUILD_CFLAGS += $(call cc-ifversion, -ge, 0901, -Wno-alloc-size-larger-than)
 endif
 
 # disable invalid "can't wrap" optimizations for signed / pointers
-- 
2.30.2

