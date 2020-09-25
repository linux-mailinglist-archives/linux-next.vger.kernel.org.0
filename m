Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85DED279316
	for <lists+linux-next@lfdr.de>; Fri, 25 Sep 2020 23:16:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727511AbgIYVQR (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 25 Sep 2020 17:16:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727482AbgIYVQR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 25 Sep 2020 17:16:17 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67AA7C0613D6
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2020 14:16:16 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id f18so4437957pfa.10
        for <linux-next@vger.kernel.org>; Fri, 25 Sep 2020 14:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=55PyWr34biEDbu3JvsEj0XeSgK/s1KifuEokrJ9uw8o=;
        b=lS6mzYDjeglwZ8LWkDF3qED4EEy6wjt639vGroQNcpNQrXxqFxslT+7xWwYz3b9zmb
         CzA8uYWsfAH4cTnNEY7rWVaWrVZNbmzdvVuNTYqHjpZBe7iUpsG6l48Mjq8JHCibxhX3
         4rYEPjFkMATB3t6F17GXOaCrf3vG+S1VMrQ9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=55PyWr34biEDbu3JvsEj0XeSgK/s1KifuEokrJ9uw8o=;
        b=XRFJ5AoqCBd6bcAZ4XVQcVFq/R2GI1ntiqb7j5sLCuoDxvMjYWCp1uA8xDkIR5YcBU
         Q7wWNDUhDpojy9tuz091Qnjskf4cJTbmwHeE/E5XzicvAkiuAzzrtU3uQfi1fujLm+jm
         HhiMfnQedHuyMFDxG6/qnw+nPiJmo/c37lBQyaxabl+63qsgJzq3n9R4fyrPE9p6apXs
         sJoOP/4S/TYrPgU2dEhPIIQ0RfNmVX+KBS6pVEdaipIX9ogGZbmgvZ5p04WxKTncwx/S
         7q53tiioYa91SWpOI30aDY3tt7iTjU1L1Uo8yQH4VbSE73UJYRcMCreSpL8AZ9AS6BKu
         Ufqg==
X-Gm-Message-State: AOAM531oMIqCrQVgmwDJ4BUexpJ1SceHb8i7Fwq5O2XidlG5ETIbBT5t
        WKrF6xkqOhSuexPXM0JKwOO4bg==
X-Google-Smtp-Source: ABdhPJyjkD1skWphhKbK4Dcb7IHRhoIlmCbnIkoXbgrDslWFDxFt21/1MBLctYp4VAG7P337QhGxxw==
X-Received: by 2002:aa7:96bb:0:b029:142:440c:6ebc with SMTP id g27-20020aa796bb0000b0290142440c6ebcmr458230pfk.22.1601068575877;
        Fri, 25 Sep 2020 14:16:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e19sm3761025pfl.135.2020.09.25.14.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 14:16:15 -0700 (PDT)
Date:   Fri, 25 Sep 2020 14:16:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Shuah Khan <shuah@kernel.org>
Cc:     Hangbin Liu <liuhangbin@gmail.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>, Tim.Bird@sony.com,
        lkft-triage@lists.linaro.org,
        Anders Roxell <anders.roxell@linaro.org>,
        Justin Cook <justin.cook@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [PATCHv5 kselftest next] selftests/run_kselftest.sh: make each
 test individually selectable
Message-ID: <202009251414.15274C0@keescook>
References: <20200914021758.420874-1-liuhangbin@gmail.com/>
 <20200914022227.437143-1-liuhangbin@gmail.com>
 <CA+G9fYvT6Mw2BamoiVyw=wLUqD-3LB2oaDqcuabOyWfFxEN1qg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYvT6Mw2BamoiVyw=wLUqD-3LB2oaDqcuabOyWfFxEN1qg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Sep 25, 2020 at 01:51:53PM +0530, Naresh Kamboju wrote:
> On Mon, 14 Sep 2020 at 07:53, Hangbin Liu <liuhangbin@gmail.com> wrote:
> >
> > Currently, after generating run_kselftest.sh, there is no way to choose
> > which test we could run. All the tests are listed together and we have
> > to run all every time. This patch enhanced the run_kselftest.sh to make
> > the tests individually selectable. e.g.
> >
> >   $ ./run_kselftest.sh -t "bpf size timers"
> 
> My test run break on linux next
> 
> ./run_kselftest.sh: line 1331: syntax error near unexpected token `)'
> ./run_kselftest.sh: line 1331: `-e -s | --summary )
> logfile=$BASE_DIR/output.log; cat /dev/null > $logfile; shift ;;'

Yes, please revert this patch. The resulting script is completely
trashed:

BASE_DIR=$(realpath $(dirname $0))
. ./kselftest/runner.sh
TESTS="seccomp"

run_seccomp()
{
-e      [ -w /dev/kmsg ] && echo "kselftest: Running tests in seccomp" >> /dev/kmsg
-e      cd seccomp
-en     run_many
        \
-ne             "seccomp_bpf"
        \
-ne             "seccomp_benchmark"

-e      cd $ROOT
}



-- 
Kees Cook
