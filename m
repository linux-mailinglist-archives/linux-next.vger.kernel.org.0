Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3C6251B60D
	for <lists+linux-next@lfdr.de>; Thu,  5 May 2022 04:43:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiEECqG (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 4 May 2022 22:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239805AbiEECqE (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 4 May 2022 22:46:04 -0400
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A690E4D9E8
        for <linux-next@vger.kernel.org>; Wed,  4 May 2022 19:42:26 -0700 (PDT)
Received: by mail-vs1-xe2c.google.com with SMTP id q2so2989305vsr.5
        for <linux-next@vger.kernel.org>; Wed, 04 May 2022 19:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=TxHlq8yop8LH/FlkX6AhN8L6sqaOjtwhTLWOKH2lmRQ=;
        b=AN+C5OaBX9rsIG/YOpu5xZq7/VB8wXw6MEILuJsJJx93W6jJIGruqLObp5FFLDSnWl
         3U/D7EjOAdNFKr5gyrEsEafseWvgDBCKU3+cN7elsfS7RMh084n8CaHIKlYDXsqcuTdK
         7CoDEzPvefzsxgdIhx83vF5/oO3YbJ/a6lio+kgeMb0d6s0xPamDS3R6Dn4AxCY8v/Kr
         zFPq/9/648pqThK8fXse3nymqfSZoU7DsNUS8GRpjeVo93alLjhbW3z/OgdaDMfC/OYf
         pDgw4+4w+uP+Yz4MdLL9I16gxtnl7h6kH9EcagHJC8pE8wuixPn9UQuHdtt6+U8VomLt
         r5/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=TxHlq8yop8LH/FlkX6AhN8L6sqaOjtwhTLWOKH2lmRQ=;
        b=R/cf5iLlbH7gdNYoq6KYpOMRKHK3IN/4jOQXC8ZAKCS0wueKUQ/ZOXtP9bx3sFmgv4
         gRFTbe/gopmcWoxc8XNA9NbbevjDFg035U7Z8tyTLhOXeFp2pl5Nhh1c/ZmVyPPWzLYU
         jJG9vfMGtESTeKpn3U8Tk0ePK/ty3vFLjGa4JoCduGdtBgEekvr7zcymATGLc4nIz6Gs
         AS50aEIJRVGb4u8P6WPoY/F/uCdZPDwFkliEbCuPseKgieGyT1WeynIRJCGAQtWCufQ2
         FtxKD5m9xJtVrFJO8c+IRp6L8O8nu8dgRzh+oK5pVT6UDeVED2P04aV9PShCdC40m9LC
         hd8w==
X-Gm-Message-State: AOAM5326mogdTBQQzamynK9rehDtvdZMBjyH59YICFnvN4sa7X4j5NGU
        4x+1sfPPJt3E+Ws2WeThMEX9D1hy0UDdfBUmFEE=
X-Google-Smtp-Source: ABdhPJxUrrmxTaPjBq7XrryqE7Y5JalZ+N4PJFdvW74W4Bwf6J/vNYDE2ALkqwym7qxhWOXdX4fOj1Tw/az3MtAZfJw=
X-Received: by 2002:a67:fe17:0:b0:32c:e77e:c3b4 with SMTP id
 l23-20020a67fe17000000b0032ce77ec3b4mr7612274vsr.11.1651718545550; Wed, 04
 May 2022 19:42:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:c501:0:b0:2ab:54ee:cb22 with HTTP; Wed, 4 May 2022
 19:42:24 -0700 (PDT)
Reply-To: revmikelivecom842@gmail.com
From:   "DR.ADAMS ROSE" <michael1james333@gmail.com>
Date:   Wed, 4 May 2022 19:42:24 -0700
Message-ID: <CAFzT2rQLhDdOsuoAb4gh0ZopPvZaRgu5msCoi38dLMHFRnt6RQ@mail.gmail.com>
Subject: Attention Beneficiary.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.9 required=5.0 tests=ADVANCE_FEE_2_NEW_FRM_MNY,
        BAYES_50,DEAR_BENEFICIARY,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,
        DKIM_VALID_EF,FILL_THIS_FORM,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
        FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,LOTS_OF_MONEY,MONEY_FORM,
        MONEY_FRAUD_3,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e2c listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [revmikelivecom842[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [michael1james333[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [michael1james333[at]gmail.com]
        *  0.0 DEAR_BENEFICIARY BODY: Dear Beneficiary:
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  3.5 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.2 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.0 FILL_THIS_FORM Fill in a form with personal information
        *  0.0 MONEY_FORM Lots of money if you fill out a form
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  0.0 ADVANCE_FEE_2_NEW_FRM_MNY Advance Fee fraud form and lots of
        *      money
        *  0.0 MONEY_FRAUD_3 Lots of money and several fraud phrases
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Attention Beneficiary.


Your Bank Draft worth of ($4.5million)has been credited in ATM VISA

CARD by the issuing Bank, be inform that you can not withdraw more

than

$20,000 per day this is what the Bank said you will see the rest

details when you receive it ,I have also registered your ATM VISA CARD

Sum ($4.5million) with (DHL) Express Company reconfirm your contact

information as follows.


Your full name

Delivery Address

Telephone Number

Your state and

Your Country.

Contact person REV.MIKE EDWARD

Email; ( revmikelivecom842@gmail.com)

Phone number +234-9015065394


So I have pay for delivering and insurance charges, I paid it, so the

only money you will pay them is security keeping fee which the state said

that I will not pay for, but the keeping fee is $125 dollars,and

I deposited it yesterday been 4/05/2022, And I did not contact you

yesterday due to low connection, so that is why i did not pay for

keeping fee, So I want you to contact urgent to avoid increase of

their keeping fee.


Your faith fully

DR.ADAMS ROSE.
