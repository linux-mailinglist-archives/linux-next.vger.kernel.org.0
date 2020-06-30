Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 31EFE20F0D5
	for <lists+linux-next@lfdr.de>; Tue, 30 Jun 2020 10:48:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731731AbgF3Is2 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 30 Jun 2020 04:48:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731732AbgF3Is1 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 30 Jun 2020 04:48:27 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81A3C03E979
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 01:48:24 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id 9so21508029ljc.8
        for <linux-next@vger.kernel.org>; Tue, 30 Jun 2020 01:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6fsC+acqOWGmffLGOO9jUUTQnpmWJlfaJA/k6/maTXQ=;
        b=jwhzWOYTDIWkGYCjUjnh/hwQSfIQFakAv6CQUjqEt4lGOfycy+SXqpkauASE8Uv9mR
         HQv/CFC25aFyJGL1zaWOskY9nxqomD8anB5SgT41JK2+NAhLoVv/V7kapQtj1LprizUz
         9NWgdrg5DV/8QYEDqTeEoQBll6ZNiEtOUu9LIYIqDwuaV90Hauso9TljSKrWlRjz1xmS
         5k/P3sBGk/fhl23Y3JhxJup+qF6wPjQBiJmZFPfu+b47V4hlKIbXN9MJiKdk/p4O6ugh
         FfkzZelWVMWID7VeVmDc58BAsTKDDi1fjv0yA5t2BtW/F2wHXOgM/ab7n3m4BpJJL7ol
         t/LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6fsC+acqOWGmffLGOO9jUUTQnpmWJlfaJA/k6/maTXQ=;
        b=bvUj4p/WGm9CvnDMSHsVpreLf7H7yA9mBZo/EII9VCQSfWhXG9GcMsFqOs+dM8LM35
         W2n5hB09qKA8kNxlcDG611QiUVSOdzAmHZa8slNEipwHcGpjbZaSOwVhKyGBzP4PATS4
         LZni7hISC5HEqDH6soYSSlWsgaghyczc5lZddQMahMMMDQa1IG/qtb0kgViw1gu9kT5H
         Iz2o4qvEmNBOU/dMUQQBzmdMQGMGjt+fgmEahI0vV5QBA28xgeq4uXuHN2c2cgPbehOB
         a7dSqaHHlDvzbeCuE9nylzQx1JhcSF0SJh5p3HvDloyFEFVHFA97FHu/uvdGC19QCkDl
         YE8A==
X-Gm-Message-State: AOAM530iW4Qnj+ZY1dKEDacF7rslJrPO2/rfU86Hj4q/igyQ8CGon7QJ
        6CTCEJqIWsA+vJ/GVnDgPA0zL5aTACoLuDjI/EMHdw==
X-Google-Smtp-Source: ABdhPJwX4BRg7XNjPqa+bGRmf7a5TT5LE3ptad/uzUQ2PEfbNV+nz2O7wy3pdPl3lEJ0PbZmgV66tY8SYz/nHrGnDlw=
X-Received: by 2002:a2e:9ed0:: with SMTP id h16mr10660397ljk.366.1593506903171;
 Tue, 30 Jun 2020 01:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvHFs5Yx8TnT6VavtfjMN8QLPuXg6us-dXVJqUUt68adA@mail.gmail.com>
 <20200622224920.GA4332@42.do-not-panic.com> <CA+G9fYsXDZUspc5OyfqrGZn=k=2uRiGzWY_aPePK2C_kZ+dYGQ@mail.gmail.com>
 <20200623064056.GA8121@gondor.apana.org.au> <20200623170217.GB150582@gmail.com>
 <20200626062948.GA25285@gondor.apana.org.au>
In-Reply-To: <20200626062948.GA25285@gondor.apana.org.au>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Tue, 30 Jun 2020 14:18:11 +0530
Message-ID: <CA+G9fYutuU55iL_6Qrk3oG3iq-37PaxvtA4KnEQHuLH9YpH-QA@mail.gmail.com>
Subject: Re: [PATCH] crypto: af_alg - Fix regression on empty requests
To:     Herbert Xu <herbert@gondor.apana.org.au>,
        Eric Biggers <ebiggers@kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        LTP List <ltp@lists.linux.it>,
        open list <linux-kernel@vger.kernel.org>,
        linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
        lkft-triage@lists.linaro.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        Jan Stancek <jstancek@redhat.com>, chrubis <chrubis@suse.cz>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        James Morris <jmorris@namei.org>,
        Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
        David Howells <dhowells@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Sachin Sant <sachinp@linux.vnet.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux- stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 26 Jun 2020 at 12:00, Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Tue, Jun 23, 2020 at 10:02:17AM -0700, Eric Biggers wrote:
> >
> > The source code for the two failing AF_ALG tests is here:
> >
> > https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg02.c
> > https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/crypto/af_alg05.c
> >
> > They use read() and write(), not send() and recv().
> >
> > af_alg02 uses read() to read from a "salsa20" request socket without writing
> > anything to it.  It is expected that this returns 0, i.e. that behaves like
> > encrypting an empty message.

Since we are on this subject,
LTP af_alg02  test case fails on stable 4.9 and stable 4.4
This is not a regression because the test case has been failing from
the beginning.

Is this test case expected to fail on stable 4.9 and 4.4 ?
or any chance to fix this on these older branches ?

Test output:
af_alg02.c:52: BROK: Timed out while reading from request socket.

ref:
https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.228-191-g082e807235d7/testrun/2884917/suite/ltp-crypto-tests/test/af_alg02/history/
https://qa-reports.linaro.org/lkft/linux-stable-rc-4.9-oe/build/v4.9.228-191-g082e807235d7/testrun/2884606/suite/ltp-crypto-tests/test/af_alg02/log

- Naresh
