Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D4F4315B1
	for <lists+linux-next@lfdr.de>; Mon, 18 Oct 2021 12:15:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232171AbhJRKRO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 18 Oct 2021 06:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbhJRKPw (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 18 Oct 2021 06:15:52 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9384CC06176F
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 03:13:41 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id f11so10458319pfc.12
        for <linux-next@vger.kernel.org>; Mon, 18 Oct 2021 03:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=q0hRaHpw+HZu1egpib2l5BAGSi6XUGnnLq98/RXTBEI=;
        b=XhYuTlkxTPuPqYxpnI7Mo/kgnyWaT8HgM0q3vCsSNSUDOXCM5wbOuOKOqqsXmxekIl
         hRKziEoSxUQx9AaavZwTZy+IPN9/FN9fftaqG+vutcckm2Go+WeTkzQvxZSYP9kXkhdy
         ovZ92OArLbBHUDB5JwbBVzRNoWrh6euAVB0XjUMWPP8+q6UBXvGQEWIv3KGrKvKSmyDT
         OFe4Koc8nd+zt0jZOevxsTwbgGuV/oerFou/Z/IUJ56UQCykWrwFN4J0YKLQwsJrIhB3
         2w0+b1e4pOE7ck7ExIds6cw7rIiylL43yaI2I/HhdqOvEuYQNJ5UNesB+pDFpoL4LHZu
         VIaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=q0hRaHpw+HZu1egpib2l5BAGSi6XUGnnLq98/RXTBEI=;
        b=WjlDI02Rnl0KoNpbnx+PZ0riBZLYHry8D0atsaA9rl24P+uTd8g+NEAY/aRpnZ/6sJ
         Dd4PCSzHwB3Cpuln3J2a3zAg5D0W0rdsMVyd4nY92RWhKn6Ek2i3Bttk03FrNKQxebny
         Lt8Sxah9GSQRAJnHkEQ5EQ5VeAwyTG+FpAD0VPKO9sEsYE0B2KvT+KIEb2qFiId2Nq65
         IthXdJ19EQDX+plxHjKlx3JT+XIJ7UKKHMzgdUhVHY/H6Yw2yqmw8WmGMFT2qWQvRUs6
         Gs+myuIJQ3WcKHSHcx5L7pHmsQolweTn9sfA3ib1QUGqT+pLD9WG4yse9mcBXlfQg0B0
         vWNQ==
X-Gm-Message-State: AOAM5312duJZCq6dvbWyjicJK5N1w7CHArsjZUOJDQULY3mRJzxErXl0
        X4FmXPvV123A0CsXnw0hEDMG9/QRqOn7eCgbEF8=
X-Google-Smtp-Source: ABdhPJxtXxin9Sf/W/aiWnCZRLsZRkPB+TM1/ocbCKA9rwa8EAyM3rXQ2M1CALEXQVb+wZsBr3aFC/t4u3Jj9JCJUxw=
X-Received: by 2002:a05:6a00:c1:b0:44c:ec40:b47 with SMTP id
 e1-20020a056a0000c100b0044cec400b47mr28056997pfj.76.1634552020724; Mon, 18
 Oct 2021 03:13:40 -0700 (PDT)
MIME-Version: 1.0
Sender: tomcrist290@gmail.com
Received: by 2002:a05:6a10:d10a:0:0:0:0 with HTTP; Mon, 18 Oct 2021 03:13:39
 -0700 (PDT)
From:   The Douglas Foundation <michael.douglasfoundations1964@gmail.com>
Date:   Mon, 18 Oct 2021 13:13:39 +0300
X-Google-Sender-Auth: juWfP1p6lw4vCcZI1EcpF28LPsY
Message-ID: <CAMZD9CECtFHUZtymmRY3hRksn62cgC4m4MSs3ECDUDTHVVcPCQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hallo,

   Ich freue mich, Ihnen mitteilen zu k=C3=B6nnen, dass Ihnen von der
Douglas-Stiftung eine Spende zugegangen ist, um den Armen in Ihrer
Umgebung zu helfen. Kontaktieren Sie Michael Douglas f=C3=BCr weitere
Informationen =C3=BCber: michaeldouglas@douglasfoundations.com

Mit freundlichen Gr=C3=BC=C3=9Fen,

Joel Douglas.
(Familienmitglied)
