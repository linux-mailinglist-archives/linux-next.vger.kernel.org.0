Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AC917DFBDB
	for <lists+linux-next@lfdr.de>; Thu,  2 Nov 2023 22:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346120AbjKBVCc (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 2 Nov 2023 17:02:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234464AbjKBVC2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 2 Nov 2023 17:02:28 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E18418C
        for <linux-next@vger.kernel.org>; Thu,  2 Nov 2023 14:02:26 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c434c33ec0so11660975ad.3
        for <linux-next@vger.kernel.org>; Thu, 02 Nov 2023 14:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1698958946; x=1699563746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=568xToxZkocjSw2LP56h9JKoNDjBFNgUBrVkBAMw8eg=;
        b=XnnDc1hkJmF1SpYkDNJXiZ2RmnqDtRt1Euurgy9sVEJPCkzuM0+X7mMg50XSkGdW/e
         1jgSOeRWFa0UJBn9syH1V2sIni+L7fZyOFcs9o80NT3mDsZW7RB3vjeclhhJUvBcnNUe
         N3V71wRgUFpkxZ8gvXGJLCFY4vPkkpHwX7OLZ5Lt9rNp9gJaGn2cZ2fx/e/EOu/hfP1y
         E9RDSoMd3Ak5O2ABWedo28PLjqmW18BxHszTe5E7eHasszkHyK/TjOAD3YiIr0IVPFhH
         WD0xRSuxNGsFRyBmJVdgO3gvMM410pitIuteSNGZYqF7vm+CKQIklDpZnzGm8X5OX8L+
         0U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698958946; x=1699563746;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=568xToxZkocjSw2LP56h9JKoNDjBFNgUBrVkBAMw8eg=;
        b=MHfqsUDAT0CvXYLBDwLHreqtIbLUgk9E/MVZmkEc0daLI122GTvsH99Ywlpy3gowbc
         nMrOeBds9H2jQowaF/RiFE/+ABfcFWerw8cydsvuMLBJq3yhOW8o4V+9843ZTPQoaZkM
         1nk1y0PQisOG2kfJjFOg0zxxIe4NB0l+hfaEaZxZi0ogipdMoqw9aJRoJhPn8IHezDfQ
         MtDWPrTw8C8Z3HZV2jMfEHl4WCiE1OV8PNINGeB17g9Nq1/A2Wvy97fScVOqC4OkpbiZ
         i+uIW5r3OCLy/FC/Zw7VZRjw7XH6jZhjHZNOGNW37uD7keJmIeUIGkwZEoNt465HY+8x
         unCQ==
X-Gm-Message-State: AOJu0YwBDE3vBLHzUZ6gwRTcAp1yzjCKPatj76f1NTmJ+BI8Tol23Dsa
        FRcn1K/I3XOkiLcJMU7Rjf56Dg==
X-Google-Smtp-Source: AGHT+IFkM44euvxDR4qdHiQ0XQgClqPVir+at5SUMMPkmpHmzXg56NqFwWtEGi2KaoeGhomseV20VA==
X-Received: by 2002:a17:902:e745:b0:1cc:45db:e21e with SMTP id p5-20020a170902e74500b001cc45dbe21emr13961691plf.37.1698958945567;
        Thu, 02 Nov 2023 14:02:25 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id x11-20020a170902ea8b00b001c57aac6e5esm151808plb.23.2023.11.02.14.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 14:02:24 -0700 (PDT)
Date:   Thu, 02 Nov 2023 14:02:24 -0700 (PDT)
X-Google-Original-Date: Thu, 02 Nov 2023 14:00:57 PDT (-0700)
Subject:     Re: linux-next: Signed-off-by missing for commit in the risc-v tree
In-Reply-To: <20231103075521.74a94ee2@canb.auug.org.au>
CC:     Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Message-ID: <mhng-66e5d8c0-2a7b-43e4-8d8b-dec50c7730c9@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 02 Nov 2023 13:55:21 PDT (-0700), Stephen Rothwell wrote:
> Hi all,
>
> Commit
>
>   c1c99e5f1b13 ("riscv: errata: prefix T-Head mnemonics with th.")
>
> is missing a Signed-off-by from its committer.

Sorry about that, this one should be fixed.

>
> -- 
> Cheers,
> Stephen Rothwell
