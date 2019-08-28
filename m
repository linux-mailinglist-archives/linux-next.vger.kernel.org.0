Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8651FA0943
	for <lists+linux-next@lfdr.de>; Wed, 28 Aug 2019 20:10:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbfH1SKC (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 28 Aug 2019 14:10:02 -0400
Received: from sonic311-30.consmr.mail.ne1.yahoo.com ([66.163.188.211]:37792
        "EHLO sonic311-30.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726554AbfH1SKC (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 28 Aug 2019 14:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1567015801; bh=3pPQVTtaN3xFNYoQC6YM96DsP/BKVutNTYzvSw+F7lE=; h=To:Cc:From:Subject:Date:From:Subject; b=a4k82778dh7YpWimPH9Oi9QOtovKKATO8kxyNveG8Jcng5EIsakvfT8Hf3SwdQ/BIfdjxeBCUiRUeK1iz/F7bOvNcY/71C0jgVIOG7J4RJVPEZs0YTuCUpYEQ9t+g4J1OA7vEYyh7sA1o3NcuFWuqW5oO5KdLE7LpxUd5xOJ0nz2hMOf2viTEWWMrv6C9gkT/e/0/tzNMs5HVdzPebzVNQplv92ssafC5aZIhxvDL9gbWtUWkXPaB0qC5/jFxQIFxi9yYOyNtlekF2GKwqbos7WJwJN0yPQQhgc2LYCnHXYpXYGCmVGspFM4+BDzWpT7x5gfuoYBhToEgdLVXEHz3g==
X-YMail-OSG: mSXIkWEVM1kdy6J8LJtMKA5oky.Wf7H0BbKIMVyyK9HxRyFFq94oqQTjj_jawnI
 b6VdCihlyBwqQmXBkxUh4bfoO6UJBoRSaO5NpH8JWwH_8OhjMZmpMLBdntj2tE8lLNAmRbqhIn5A
 DMZAj1GU21jLnMHAd40V_fNOHxSQI8qCzfC29pnEDrbi3t3SLGPiDPPf7w7Jp4QBCIVMCW4cmwvw
 DhCXE.DFTf4NBmyKsdnuEA52mCCBfMF6tgYWbkRylFwQNWwzRyoBBowlJhHbcS_.uB21TFi4yYnM
 bV1yiNLfljxzbbfKYmIjTGJoToNGXvMjrBM_hTj6z0aX7I.u9OT5UZxbAtRwhzuIOdCI1e4G4BLT
 DmrMVGBw5KVPsXaxhdzZkT_fZI_Nju74NTNZW3MzFx6LXxUmN6FvskgnPLfbbFY.UkuN2LV.b8Pl
 EdHsilWRjWlheeW3uFexiHsSEIvGmN5guiPwcuhAjWdR1D2Icb9wuE.etEMhDdbLqelW8Z4cGegt
 GUrJxkOcEHkUz7hxDBellFkqvfmLHWZj9OBIA_Ar3hDp0POcvNsPs4zB6349BkXJptE0ojcfsK3q
 NsVciwYcZhWWPk6GZMu2UM9NC_D1bQJO1jQwOCAwVzpO0dEI7c4svwCoMl_0395j6nM1ozEDChjg
 TIaLRjDD9ZoN298X9uY.kW3zQDxk3SbGAe2mRShl4ldy9Q4SboxXMwQINwmEUNWc.WEOBeEDCaKi
 0KiJizzW.k7U0HJe.dZgbs1PDDj21UmiKTYG.pIob3zRc8SHSQVTqGORgowXb4xiKJ9Iz3pwqvO9
 9l3CrxxRr0ttXh5Y2jDvNrQM6a9_yhfp_lInOTINhdXN_IpC0Z7MGK1tr5k6JhQaqbOWdxP.NUfh
 u1qrsHTujJYqmhyWBAqNpyPZ1P9U0jyVXO9QkG5dvHZb8r5xwWCln6fEhfuOKleyEqpUYI9BsEK7
 rC6Ns1.bG3v2Ar_baoFa3tynxhtcoT4C5nhLd9N74db7wfGEH9g4GGVMFg8dk49F55Azghf6LSLe
 w6laoAcw4WsqSy87y1uYFyRbJBs1MofUAX8COXrsZIXADn5C76JHgZIzW1bmLI4EeNOqnbejKbQO
 _n6Voqu39_K2SWRBT9NJzorkESfQdrGqfi7.BwGApsgIVyxMA9M37x_jAKJIfOZbHjWIALe0Mu.8
 Dj546Ap.zwDj3dixbDSS3cAAv_MHM9HT8hoZKv9TXAIUjiQRBxKYttKFrfMSLhNZzNqfOTC9c9GO
 Ar41DuDX8dKvpJOlSpqxiBW6.ytjwd9yIllq7gdz0sQH7Od6kSOzEqMsTJ7C4gyE7q3D6dG_jtM.
 srg--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.ne1.yahoo.com with HTTP; Wed, 28 Aug 2019 18:10:01 +0000
Received: by smtp415.mail.ne1.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID 8be2f1e377542bde2a4d249bff2b012b;
          Wed, 28 Aug 2019 18:09:56 +0000 (UTC)
To:     sfr@canb.auug.org.au
Cc:     linux-next@vger.kernel.org, casey@schaufler-ca.com
From:   Casey Schaufler <casey@schaufler-ca.com>
Subject: Please include the Smack tree in linux-next
Openpgp: preference=signencrypt
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <5746b686-fd22-73b3-7de4-43282143396f@schaufler-ca.com>
Date:   Wed, 28 Aug 2019 11:09:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Would it be possible to include the Smack project for-next branch

	https://github.com/cschaufler/smack-next#for-next

in linux-next?

Thank you.

