Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8475A2D63
	for <lists+linux-next@lfdr.de>; Fri, 26 Aug 2022 19:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232338AbiHZRZj (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 Aug 2022 13:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344462AbiHZRZb (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 Aug 2022 13:25:31 -0400
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A85A1AB06F
        for <linux-next@vger.kernel.org>; Fri, 26 Aug 2022 10:25:29 -0700 (PDT)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3321c2a8d4cso52826517b3.5
        for <linux-next@vger.kernel.org>; Fri, 26 Aug 2022 10:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc;
        bh=LcowEz/MHN6VIwZyVyshjW7bqzLnX3nnurMOL1MyeF0=;
        b=puzFGmbvEjs1MXMTmNuMzsKqel6bD3ftFe3esLTIfZMg+e/XXwCyR/RpFSvGGRLoo0
         F28TQqWZdRIT6HsUzqqPPbGnzrY8GyBGkDVROeI4aiPvL2MJZ+bLZvarbo+ynkV4dAPs
         WSJ1//Q58EDoqYoEYsIkjwsld2Sc7DG3BhRhPnrLluinWUrnTJKTJj1TmgzDt8mteTSk
         ycE/BTc0N0m+tBew/P/40JuO7nMnqQYnSXnumCq22i52ega8GB1FjTK3HJhQ7ZG1pDmn
         HHjS9M3WXcchMY5QChSEkt0pMnSUV7QzAqPinNE2FmzNabsNQ7sJ0DbUVdjvC4/Uh0cr
         VRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=LcowEz/MHN6VIwZyVyshjW7bqzLnX3nnurMOL1MyeF0=;
        b=N8AWfZ7U5jJsYXzutLraGFaQDcobN6zgfONJknuLb8DQlmv7gWP1yECqqTWr4DVAdW
         6yo7Argc1nvf4eNgYXBlewCEUJ4AAHcr9GztBqCV9f5bQ+HD65M/1TEfZZv9z3dnoKtZ
         bbxCg157L4xLakUH8DSGLJt82qK/9BoJ4BLUgGAYFQjrJGXW+brGGH4PLwG9hgGn6eTz
         Vb0UaoOTuUeiZ6snK/R9DF89krXFybg+v5HfYhwNxVwBAdQdZHLglmmJI30IJ6BlJ3b1
         Bve7UHgOhV+WjPIsbMwAxiZ2KndAax9go8TqE15JrWuSUm/jTUtEWn915pr11VTuBoHt
         z41w==
X-Gm-Message-State: ACgBeo0MDtSv88dvCjLEjcHfRymO71oHA7fCj1diUfU4xQpH3LYm8WCg
        r3vK2l9UPhmWXT6vFRC6+ZsaGfQpEdqEqNk5vM8=
X-Google-Smtp-Source: AA6agR7P/wpYWWjmXJEPjz9C6Uy48MZWhUUZ1Oru/j0ATu4rwNT1kl6k+Pj8zshCp21d4svKaisHYhSX4CKcBFeHeOc=
X-Received: by 2002:a05:6902:1501:b0:697:c614:2079 with SMTP id
 q1-20020a056902150100b00697c6142079mr667112ybu.389.1661534728969; Fri, 26 Aug
 2022 10:25:28 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylama@gmail.com
Sender: 93779247nourou@gmail.com
Received: by 2002:a05:7010:8d85:b0:2ec:d4af:689d with HTTP; Fri, 26 Aug 2022
 10:25:28 -0700 (PDT)
From:   sgtkaylama <sgtkaylama@gmail.com>
Date:   Fri, 26 Aug 2022 17:25:28 +0000
X-Google-Sender-Auth: zpcjarWsG6R9DCUli619ggKDcno
Message-ID: <CAAzAzB5ni2WVNVHJfDc6gzHs6H=Fp35hREDsaakR-ZgvbvSkFw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Ol=C3=A1, voc=C3=AA recebeu minhas duas mensagens anteriores? por favor
verifique e me responda
