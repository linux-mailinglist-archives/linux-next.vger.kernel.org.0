Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 562C41BE521
	for <lists+linux-next@lfdr.de>; Wed, 29 Apr 2020 19:23:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726554AbgD2RXO (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 29 Apr 2020 13:23:14 -0400
Received: from sonic317-38.consmr.mail.ne1.yahoo.com ([66.163.184.49]:39475
        "EHLO sonic317-38.consmr.mail.ne1.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726524AbgD2RXO (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Wed, 29 Apr 2020 13:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1588180993; bh=3KKq/DzpgaF48JaRewpvE/JDcxvgEsbfO6NVA924/oo=; h=To:Cc:From:Subject:Date:References:From:Subject; b=iyETmQV2oLY698i0RTVDzasahhqz6Pla5F8xlMoMVH4fgpPz96FsNWh96ihcl9Mjm9hZ+O6kRhR2Ta2lkOFUoqTjE76YDxVHNVEdhgDuzd6Va6i7K6+sSLTmOAjGpI1E5VIbvE0uz/ScD4TN35Q6ziU4ICBcFqVdU+POgQqTYRDiN7THIU05tbvnSW2/TmTL6kE9+JMD7LY1i3YaUEyUgleiXW/5Gc0Tlm9yJ0ykO03qxwlrDAQbhe6aNYVQiGh1dijEMcg+3zEN6nnWXjYZOa4Yib2IGXTLgEy4jfgW+93UfwjcK1HckUCM2KNiT2C9j4DplJaNc0Zh+740b3Jz3Q==
X-YMail-OSG: OsrQMikVM1nAnY70.xaNhFAS0fNZIR5ft6hDSQj_VaY_8f7KBa6Fjt_5kKxmG4j
 HyiJ6UNIR5WPQqnr0ak2iYqmxhif3zhyFFcGsELRjsFTB9RngWncrMoMifdWPIpOeLI5Zsc1RDnZ
 .CTkTMfG040d6PmFt6Yg_RKvyYlaLiBsEvHdq0iRp1V0l_5ero2lYs_v8VzdabwmRGTQ8sfNC.J.
 e6SA_y4FyFGFGhJ5yzwmkRDyHly.z.zU1U1udz8ThZACGVBrCn2j2RWuEicR26KawRIRqnUgSSSs
 qA4LwsJJvG4NZ37xcW9Vl2iMDK_G8FxfPM71jxTvOk1GUju_gaqHpT9UqbJXobweMVpWszLCOSka
 Md75OMsILC.DmKBAMj8KZGRJ6fUK91TodrT_rTMT42WB79G7m2Z9.prVGPvBR0z1bkmWoac2jvxJ
 eIOjG5J9wz2uG211B69cmTP9GgDfiGdMbVb.5X0x2QXwTB4DYJ.uGkuOunI8sA.8ngE56Se0VXmo
 NPH.WUM0frb7jR9jOMQ8TrnCJxMEFZ.XjlTn_3jMDmv4F9ixvLKbN3QGDJa6EziX7awNbqd8BpMh
 XzjmayXZ25a3ITDmfn0ZwwrMfeLJNT9B9fGg0CN9o5kdFr8ZpoppXjHqmJGdVvDxGv44efUOfedx
 ifJxXcMLTILhTYoPxd4kmY8qmcX5aZyvu02a10Jr4omSXCfdsXbxcgpnzKNlmJmfwURvrSs2_.Sg
 3I.zY3TFmEZDRnJwnfhI72yf1eC8KxWrXBrX2vkNOTEmoeTdo1vKWAnHtQSznzPnHKvWOutTlta7
 c_OCKCrNWKcb2xbLf7IH4ZWI13L._RDBr92eZWANbu82FE.5BvQbqb4ftkZ3KN5tPum7M7GBbB6O
 jCg5nlWtloBIWtW0usWmQv10E7FRBAiUCjHbY.aAQIGdlAZYow_LnylIaPpNM7Tutj1B4FMWUyNi
 e2kI3JUlqWThl28ndjsQpaZsVv1ZxMQgnlbIX_nhgkN5wVQdJUNuPaXvlVXQGAFoh6vfqK_.ijxX
 smWyGf2YZiNpkIwz5HUfqaxvifqKAcdmuI4cFRstPOp7NcE4IAoMN5q6tEsS1IOVCiuZSIzo3egZ
 NhCVQ3YFnbsrA96ELZbM6FWTyr.AyS7x0KGKmj02sVzQX6zsMuqVq4wob6nkaZuVXiKRJFgKfJwM
 b2Pkx38msryzQ3dJXRWlckDWk2OgNqJETWeW7_uzLVswYVSdWCrVDnjJ0bY69ahdgWDwrFgPYNKi
 nSW02VdFmHTiXy3uaHk92gzIhTfwIFhC7qpZKrqipiSzxCJzVUYZKYOhKvYxmrbloVTAixKIWkHM
 1apxpvb6pHsstm_zPpF6KXwM2FOm_d0Qu7qvS4DSuuno5WAopzBECR2izuX2YMRD80tt.lj3.EUs
 Vvv5jAxZWBn5MhEk-
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.ne1.yahoo.com with HTTP; Wed, 29 Apr 2020 17:23:13 +0000
Received: by smtp418.mail.bf1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA ID f646dcddebf955a8e827769d6475470d;
          Wed, 29 Apr 2020 17:23:11 +0000 (UTC)
To:     sfr@canb.auug.org.au
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Casey Schaufler <casey@schaufler-ca.com>
From:   Casey Schaufler <casey@schaufler-ca.com>
Subject: Please remove Smack tree from linux-next
Autocrypt: addr=casey@schaufler-ca.com; keydata=
 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
 abzjfg==
Message-ID: <68401d6d-190c-75ec-b311-b47b0b8a57a5@schaufler-ca.com>
Date:   Wed, 29 Apr 2020 10:23:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
References: <68401d6d-190c-75ec-b311-b47b0b8a57a5.ref@schaufler-ca.com>
X-Mailer: WebService/1.1.15756 hermes Apache-HttpAsyncClient/4.1.4 (Java/11.0.6)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

I need to replace the Smack branch used for linux-next due to maintainer error.
Could you remove https://github.com/cschaufler/smack-next#for-next from the
net tree? I should have a better maintained and behaved next branch for Smack
shortly.

