Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E98748E073
	for <lists+linux-next@lfdr.de>; Thu, 13 Jan 2022 23:38:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237996AbiAMWi4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Jan 2022 17:38:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238024AbiAMWi4 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Jan 2022 17:38:56 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E03F5C06174E
        for <linux-next@vger.kernel.org>; Thu, 13 Jan 2022 14:38:55 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id t32so1162366pgm.7
        for <linux-next@vger.kernel.org>; Thu, 13 Jan 2022 14:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=TZSnmiKfh8lQHyoHB+yllzvEmA18to6wFnOGKYs0poMgePC/IzPQirrR4ktwaDnvqN
         6MtgeXCy1yK/vlfiGBEgBcEWSdlaZhy13ZGg8bropI5LiWLT69uDg3RLIG4RAEnMei/e
         OLsKu4ckBojbKLqXja5eQdc78QuplSbLUeUuR4YwQsmoJKPsmqAxP6kAsKKrhO2uloGx
         jgBW3DLRyjuJTQuba5a1bywPT+79uteTY7MRR7+lTs5pNJAoJHK8njIEoPRz5bJHtGc4
         HFHciKQwdRnv9OQdv5RacscrcPdsiz56D1dXGcQrq4Bp8NviqIrfWkgUqnbc+T36lHWO
         JWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=YbEI3Q/NEjCtDTVCV1jkA7nYNYBH/Wfa2wk3IkVyJko=;
        b=nQl9QVx6p/8NVpvo8vICSumneDl9XID2Y916WDiWn6x8xUARXK4B1U8uEjnAHKxjvE
         LEBjGPPp8H6m0FFpaoO+c5wPy3bVQlzNn0GAGHcLPzeveodEqq9duAwg3XAHkVfUAU8Z
         XPGTWE/GZkiZU7yZXCaBbZVebhk9S5Bb3BSpWYIr2NU4FW50lhGt5AxORVr+/7yp+hiO
         uJlVQ54g1qgudQqcuN18MF3WID+2CNVO0gJR4+7mOwqcFP1VLW9WmBq5oxFpvAzkBpIC
         ZEHUHDVA/lZGWFb+LQlPfdMnRoCM7MVvsM9/9YWx+rgtVzag2I5QidVb9FeOcN4+Jrya
         HzAw==
X-Gm-Message-State: AOAM533NcWEHT9jhi547kM3i6vslH9Pt1uyW8BJuh7R8peWX4H96WJJL
        g+yYOAUgwiHbAHWPA6NM7tWzzDqzkQH5PacnPQw=
X-Google-Smtp-Source: ABdhPJxV+CDcXMAaoBlObNCE+WkBdJZDSsiMXXJxSU4qLOl+5GP7wjtV5hGVQqePL03Cw94D/ZrqizECvr4TNYXN3v8=
X-Received: by 2002:a05:6a00:26c5:b0:4bd:4ad6:9c71 with SMTP id
 p5-20020a056a0026c500b004bd4ad69c71mr6167765pfw.45.1642113535225; Thu, 13 Jan
 2022 14:38:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:f38c:0:0:0:0 with HTTP; Thu, 13 Jan 2022 14:38:54
 -0800 (PST)
Reply-To: mchristophdaniel@gmail.com
From:   Marcus Galois <marcus.galois@gmail.com>
Date:   Thu, 13 Jan 2022 23:38:54 +0100
Message-ID: <CANqBaXWLwHBNoawbz2tGySxar8jn5q2OzEiG-GjWCyVh=aJu6w@mail.gmail.com>
Subject: Good News Finally.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hello friend.

You might find it so difficult to remember me, though it is indeed a
very long time, I am much delighted to contact you again after a long
period of time, I remember you despite circumstances that made things
not worked out as we projected then. I want to inform you that the
transaction we're doing together then finally worked out and I decided
to contact you and to let you know because of your tremendous effort
to make things work out then.

Meanwhile I must inform you that I'm presently in Caribbean Island for
numerous business negotiation with some partners. with my sincere
heart i have decided to compensate you with USD$900,000 for your
dedication then on our transaction, you tried so much that period and
I appreciated your effort. I wrote a cheque/check on your name, as
soon as you receive it, you let me know.

Contact my secretary now on his email: mchristophdaniel@gmail.com
Name: Mr. Christoph Daniel

You are to forward to him your Name........ Address.......,Phone
number......for shipment/dispatch of the cheque/Check to you

Regards,
Mr. Marcus Galois
