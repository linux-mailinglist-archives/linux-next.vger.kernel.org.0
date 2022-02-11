Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 924D84B2012
	for <lists+linux-next@lfdr.de>; Fri, 11 Feb 2022 09:25:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbiBKIXy (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 11 Feb 2022 03:23:54 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:54770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229631AbiBKIXy (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 11 Feb 2022 03:23:54 -0500
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD9FE48
        for <linux-next@vger.kernel.org>; Fri, 11 Feb 2022 00:23:53 -0800 (PST)
Received: by mail-yb1-xb32.google.com with SMTP id j2so22817947ybu.0
        for <linux-next@vger.kernel.org>; Fri, 11 Feb 2022 00:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=uPj161FoBqwfpjIGQuIlnC0eL3o+Chk9EmGrSqzDwho=;
        b=XMlIx/3EBJkCSkPbdAmh1ngFFyfSvQwZ11Wkw8fGBBSNfna1v2lTIiF40kku9LxTJi
         ezcOCBEw2Vt/D9u3d9Fqtk3iqJg2d4nIL5YC9YRHpd9SRFhwDHifhnbX/PnS4IoYshZA
         Y9MVgQnrZiZJ40TZDeEYJLS8uVcM4pcGBJcA28AJX0fSv+eBjJcAF9HJFXAcOkNOmZ/u
         p9syxNOsRR9RlQ4HJULP02nusYcN6aM16Jynwo5F3DQ1v80/+5/vqE/z4Nf6s0hUST2M
         kIfP+eL8m/t84VqEo7NjNXyf9bEhbdurIJioy/+oTyqmq1HxqvVmM3VjuIQB8WKWkm3C
         R9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=uPj161FoBqwfpjIGQuIlnC0eL3o+Chk9EmGrSqzDwho=;
        b=6wzDfOk5dP7HHEyQllOoQDTIjwCP9kOoOlWYUpo8n5msxmM62N543Y71M9wqi6Cg0r
         2adCRx2DBZnhyGWiRfkzUS/7wQI8ZmLeIS0HAHVMPKb8L5ojMikxKVT20IwusgQcDr3a
         xbGJO8zVPSkA3TssG+PsYFJ8goDysJVOxIrj2/M+skLmDKfswZv8ywe2LBziSMbGVJyb
         JA7OuuYle+B5D5b+o9Le4yjhLCQo53PoA365j8z0NnVYpfFPfCFXNmJCn5IItzPjrqe1
         h2AnSwDAy3bciZvl3EdYPlh3L9kDmHiNGHmCg3Xq7EKp8b6R9Z496b69XP2eHJhYormr
         mZUg==
X-Gm-Message-State: AOAM530UiKoSsyJhK/Hbi5vB9QCmz816AreyfsQzd8p0zAiNstGeNJsC
        pycyVaQOxOXfXYbHQ60YSnVLKtapy2WkqZoJP6s=
X-Google-Smtp-Source: ABdhPJzH5V9PViLvPOBOLIxYvPe82PmqmYGVW7/04UnN0ryYlijjOCBPoxqm2XjdyG4LvugW/JIbvxPRTnI726lWWq8=
X-Received: by 2002:a81:bd14:: with SMTP id b20mr556317ywi.431.1644567832885;
 Fri, 11 Feb 2022 00:23:52 -0800 (PST)
MIME-Version: 1.0
Sender: patolawrenceloanhome@gmail.com
Received: by 2002:a05:7000:1e8b:0:0:0:0 with HTTP; Fri, 11 Feb 2022 00:23:52
 -0800 (PST)
From:   The Douglas Foundation <thedouglasfoundation1964@gmail.com>
Date:   Fri, 11 Feb 2022 11:23:52 +0300
X-Google-Sender-Auth: nOCFOKwP8I7GJzlXyOClYJgNL7s
Message-ID: <CAPKtMDEaQev_Hf2=DK6jW4o__USq1NFT=K=-NfdnrRqkPCUdig@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLY,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hallo,

   Ich freue mich, Ihnen mitteilen zu k=C3=B6nnen, dass Ihnen von der
Douglas-Stiftung eine Spende zugegangen ist, um den Armen in Ihrer
Umgebung zu helfen. Kontaktieren Sie Michael Douglas f=C3=BCr weitere
Informationen =C3=BCber: michaeldouglas.charity@gmail.com

Mit freundlichen Gr=C3=BC=C3=9Fen,

Joel Douglas.
(Familienmitglied).
