Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D30067BC7F
	for <lists+linux-next@lfdr.de>; Wed, 25 Jan 2023 21:25:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235705AbjAYUZS (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 25 Jan 2023 15:25:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234492AbjAYUZR (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 25 Jan 2023 15:25:17 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF45A3028B
        for <linux-next@vger.kernel.org>; Wed, 25 Jan 2023 12:25:16 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m15so14641705wms.4
        for <linux-next@vger.kernel.org>; Wed, 25 Jan 2023 12:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wurMI0e/6kU3Ra6nRfONxCRHUpQVKJO2S1y2IziaWoI=;
        b=MWWRQoUR6m0F3i0d6Pk9q4mh7va7LHQzpvpQUIXc1b26a8DM39QyW1ojKiQ7XXdbtM
         V5DFSuVMO7Oug4OVh0lfp1s8dpdZoyYBR0KNhjXkFVjCg614pF7bGh2QvngPnTKWpUP6
         lvLDFimbxNz8/pbgK5Q2X6Fy9qFAqKojzBAmLVyemXU4GrW+6aTN87zZRWeL6m1hf4Vh
         xLmjSMT8oSdxFWsooZp361gjSN9+q8thJ9RTgzyUOYWlq7q2ZD9588JP3+aifyNQLjKs
         ydIGAa1szgJn/995ZYvqTiXxdOTBSIJ7lb6IGlBpIhMDG6Y4BtGjYo8tTC5n48kW39C5
         Z4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wurMI0e/6kU3Ra6nRfONxCRHUpQVKJO2S1y2IziaWoI=;
        b=ZpETZvQhJrI2Wq9DSj8kF5A2xDBftOIspVat+/2wJ0yL/27wQttxT/jb878SdxHtli
         xaqLpZaH9Xs9GvoP+wRZNnoJ52N1Wakk3m/GHp3YRqCVAiZO1VmEpP1iyxgcqt1SSmS5
         I+AddMBLRJvK4QA40DJhJ6mt/vNQqvbh1KTalsjOYYwIlLfHmJ+Z8DjtOJzb+WDKbXGo
         j/IoLai1/Elyk3xCedWIcrBtE2PtrwVEo+RT6aIUkzT2bhvVSmcyptLjdPgK3SDa5I0R
         yaR2SETeZv0HFmuuT1XWLCDH8Dj/jxppr7SlP9OlYx0ae9ZI/c88RRw3S3Gs9Q7uKXZB
         /gXA==
X-Gm-Message-State: AFqh2kqFbmD8lU54n01UObquf1xdhiki9Jl32ax9GxSSXrG0GBrF9j8Y
        hSJXfWiJd06K7RJ/aHl24Yc0cTmXL2kzllB9fenbp+lgWVxQOA==
X-Google-Smtp-Source: AMrXdXsqMfpWKil+Cz2zA5fcj/mKqeUxo3iE+k2prB6okCiosmTcxyurBkam9OzQ7ar9X+09MXSsf0fUJmtF+KPM6jk=
X-Received: by 2002:a05:600c:1c02:b0:3d7:8c6:a8cb with SMTP id
 j2-20020a05600c1c0200b003d708c6a8cbmr2145646wms.82.1674678314986; Wed, 25 Jan
 2023 12:25:14 -0800 (PST)
MIME-Version: 1.0
From:   Eric Van Hensbergen <ericvh@gmail.com>
Date:   Wed, 25 Jan 2023 14:25:03 -0600
Message-ID: <CAFkjPTnULXdFY5tFrBHD6exgJt-3gszkm8UBsu0DeD2Xa_inXw@mail.gmail.com>
Subject: Re-add v9fs/for-next branch
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        linux-next@vger.kernel.org,
        Dominique Martinet <asmadeus@codewreck.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

After a decade hiatus, I was wondering if would be possible to add my
for-next branch
(https://git.kernel.org/pub/scm/linux/kernel/git/ericvh/v9fs.git/log/?h=ericvh/for-next)
back into linux-next.  I'm going to be doing quite a bit of work over
the next few months fixing up performance and have already coordinated
a bit with Dominique who has been doing much of the heavy lifting of
v9fs maintainership over the past decade -- but is worried that he
doesn't have the bandwidth to keep up with a high rate-of-change.

Thanks,

          -eric
