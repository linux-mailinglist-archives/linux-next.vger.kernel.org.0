Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 957184D2FD1
	for <lists+linux-next@lfdr.de>; Wed,  9 Mar 2022 14:19:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230369AbiCINUv (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Mar 2022 08:20:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbiCINUu (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Mar 2022 08:20:50 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11EA117288F
        for <linux-next@vger.kernel.org>; Wed,  9 Mar 2022 05:19:50 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id v62so2300410vsv.1
        for <linux-next@vger.kernel.org>; Wed, 09 Mar 2022 05:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=xVJHepNq93ePmAbCv1LHbdOWJcqWYQh8v11fr0KUdVw=;
        b=LnejyCzOIh3SXgKZDqKBcMT1XI5Awxa7srTgbnEmmaU3IVJMCeMLrOAsOkqgzwv/vM
         HF/+XvQc6v3QxDDKPBIEPSDGgQM7LFHgv50Ua1iOJsFLooxHJW79Dc0UgwYgTO8f+EGM
         lrU5+jhBT2WBo16pAcDXccfeH0uckvC5sDIjayQq3YJFO3MRwUHVtb4sIyGVnidt4QlC
         V+mkcEiJsdi0uibgFMP7uXqRfp15Np0tQFZuwllTfZyK8dvrshYy+7ZKNaOs1rmLdAAJ
         mGuVO2gYFz39kyV8go5x2HuIuZApPQ1gydwElpCkYYV7yjQztSa1vvHUHCy4i6vA34GW
         V/bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=xVJHepNq93ePmAbCv1LHbdOWJcqWYQh8v11fr0KUdVw=;
        b=EXkHkIFGr+1EGr6ckVygwRSVRU/DOJiZzuffGvFNDDNTKAutWl7Km9w3AuxkTVL3FD
         84a+yU78TqNBzbAJmtrqUEp3t/SEyh66lJjGww1SnU5h1gy5YISLGq9V2R/FnB/RdSwB
         1gbqN/bwGZRXsSR++fK5hjHIXFK8HDiONhOTQE21YnIVlN+FPzEJIoHP7HG8fatupo/W
         q4dEuy/rrO8lH2Bj9DLxKPL5I56ZXfNKu+a5f/0lL09nAF0tsrTo0I1BOw7aLVliGho4
         3gOgh7Q70comUt8gdq1Vavh4NpSYL8+79VgtB3wIHkTRIn3lSvXPYQSk8VWUCgKZGCNr
         mo1g==
X-Gm-Message-State: AOAM530cFMQD/tXIBTb7I0JF1b6prZ5d3/Ms7a26vT1JyUACQaikQPyD
        Zwl4HV1tWwrPVCAXRfpu8xTr2aGILngEJrKElhY=
X-Google-Smtp-Source: ABdhPJyRRilmzk1/yP3S+eFkDi7pZv3nfFeyCoiIEWipOIxZVdy29AunsgJKCXwMk58ueKa6J2IYmLNwzSFsc3T9Pvw=
X-Received: by 2002:a67:1dc1:0:b0:31e:650d:a7ad with SMTP id
 d184-20020a671dc1000000b0031e650da7admr9589738vsd.85.1646831988680; Wed, 09
 Mar 2022 05:19:48 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab0:3ae:0:0:0:0:0 with HTTP; Wed, 9 Mar 2022 05:19:48 -0800 (PST)
Reply-To: lilywilliam989@gmail.com
From:   Lily William <tz649296@gmail.com>
Date:   Wed, 9 Mar 2022 05:19:48 -0800
Message-ID: <CACC2Mgh-e2Lth55ZiWiLNm+d1V1Dxv7VGv2DzVxDTf2h=5+uuw@mail.gmail.com>
Subject: Hi Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4955]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tz649296[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [lilywilliam989[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [tz649296[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.6 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

-- 
Hi Dear,

My name is Lily William, I am from the United States of America. It's my
pleasure to contact you for a new and special friendship. I will be glad to
see your reply so we can get to know each other better.

Yours
Lily
