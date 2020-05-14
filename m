Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404671D2FC9
	for <lists+linux-next@lfdr.de>; Thu, 14 May 2020 14:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgENMbP (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 14 May 2020 08:31:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726124AbgENMbP (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 14 May 2020 08:31:15 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5CBC061A0F
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 05:31:15 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id g185so2716585qke.7
        for <linux-next@vger.kernel.org>; Thu, 14 May 2020 05:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lca.pw; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=rXUjuNQKfOwsiQsnf8kbEEKYDtZNdCEYADSwV7JyE7o=;
        b=j0Hz9qCfXTLgLzIb9XaI9TvQpOF1a6NwMMd45yEfuG2KvgPFo6tcD9kq+QTG7iYcHG
         zqtXbZxaeOLZ/XJxQYjZYhzCrqEmNUaMhi5ke4EVXIJmZs9SW71o2KOa+w6cU0UuWpWO
         GIu8Ee81QOUYF7Mgx0P4/U/JvznK9Pdd0hf+Nq3BYmiu8iXA8aO0lyGQjoyJKg8PuC5+
         UhLhLS2Q0EiHfWpeVANgZGDEifWR0YTOC4uahsyk9tB1aldhrinJBhv9aHngCgN2QICl
         eOQvGHPHsNjnVhPh6d3G+WippDrI15t/w+MzTrap5e0Lq2t+9o+F1TiSUnNlhY+2uE6S
         qA9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=rXUjuNQKfOwsiQsnf8kbEEKYDtZNdCEYADSwV7JyE7o=;
        b=TTm0ekssun16kf00pxQDcz7k/1kMNLha+jy8m1kDxXd/NtdTce8pQ9IyEknXpR3z8d
         TFsFwTRhUXG40mHPAstqqYXvwb9cSbcWRN0lTwyU+iregYaJxdwP7Wb9Jd+cJ3M1pELR
         F3ysGMftdxuu2TVobHMTWvEQKh3G1iydHrw+1EFpWKgoahgdurf7UiaalMaHeXixaPJU
         OMRsAdvD7LkQ3iAjh7ljP5Fy4/HKwJjNbpIq2Yktl7el1y5KEeLA8DLQk50k9fE4W5SB
         z/DmUYn6FZPzydjpsucDAwU3kFurt9XALFXB8ApleO5dlCMRYhh7J6YdRzk23Xs5uvIu
         GYPQ==
X-Gm-Message-State: AOAM5312ogU7JjTVGuZtEnbBysGJ9fW5TI/LRNcqzMLAeFMFcVOlOoOy
        Do2jOh8iFT9uyIdAkxH1ThaiJw==
X-Google-Smtp-Source: ABdhPJzsfUagLYdd1iwZS5RuppqKxjj13xRYfKcnhxCAlq+6SV9PHRT4cvrmZGXg9GEM2JjXGkHL9g==
X-Received: by 2002:a37:78c1:: with SMTP id t184mr4527270qkc.213.1589459474634;
        Thu, 14 May 2020 05:31:14 -0700 (PDT)
Received: from [192.168.1.153] (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
        by smtp.gmail.com with ESMTPSA id l184sm1047116qke.115.2020.05.14.05.31.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 May 2020 05:31:13 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Default enable RCU list lockdep debugging with PROVE_RCU
From:   Qian Cai <cai@lca.pw>
In-Reply-To: <20200514222535.259cb69e@canb.auug.org.au>
Date:   Thu, 14 May 2020 08:31:13 -0400
Cc:     "Paul E. McKenney" <paulmck@kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Madhuparna Bhowmik <madhuparnabhowmik10@gmail.com>,
        Amol Grover <frextrite@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <ADC503BE-32C0-46BB-A65E-59FFEC30ED57@lca.pw>
References: <20200514222535.259cb69e@canb.auug.org.au>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On May 14, 2020, at 8:25 AM, Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Hi Paul,
>=20
> This patch in the rcu tree
>=20
>  d13fee049fa8 ("Default enable RCU list lockdep debugging with =
PROVE_RCU")
>=20
> is causing whack-a-mole in the syzbot testing of linux-next.  Because
> they always do a debug build of linux-next, no testing is getting =
done. :-(
>=20
> Can we find another way to find all the bugs that are being discovered
> (very slowly)?

Alternatively, could syzbot to use PROVE_RCU=3Dn temporarily because it =
can=E2=80=99t keep up with it? I personally found PROVE_RCU_LIST=3Dy is =
still useful for my linux-next testing, and don=E2=80=99t want to lose =
that coverage overnight.=
