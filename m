Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54BBF6ED06E
	for <lists+linux-next@lfdr.de>; Mon, 24 Apr 2023 16:40:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbjDXOkH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Apr 2023 10:40:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230287AbjDXOkG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Apr 2023 10:40:06 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0DCF6583
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2023 07:40:03 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-94f32588c13so637509966b.2
        for <linux-next@vger.kernel.org>; Mon, 24 Apr 2023 07:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682347202; x=1684939202;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lv6YZKA5Nm7QSYe8EC5LMJOaBGiGh4YFtQkK957wtJk=;
        b=bTnWERUxw1+uemlm3JDbWQHe+Cb1H6shIPYyMCVB4x8/sk6m66xJrwzmtdrGRPv9pF
         fc+oEKgJIVh+CYEB9VAELqRmcOmgls8BSjh+igSBSZ+Q/KLNveZfmVshkyz1IRlCTiOp
         PHanKLm1JMuJfvKTbhCp3O30Vt87tu9cfCA8iYltHlDelHUtKBEuTkYqKrCiRj7R5ad1
         u/h96Q94W4NNa++qe2grUBuoxcXdrNxVj/1allfZ378zGk6FxXHgXckXfZMBJius8vQI
         MhcydpXh9qCfobthxQBNnoZWy8ghBiBDChpBlJUUfocmZNz/jAxYa4P7k/yD13u2JvVQ
         h97w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682347202; x=1684939202;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Lv6YZKA5Nm7QSYe8EC5LMJOaBGiGh4YFtQkK957wtJk=;
        b=h2mYjaIUJ0RpVtA8U0b9c7DiPZefJFTrvomQCa62HRMsxdikCMp2fmGr1qwquEjtxw
         4pCWK1zD+YfIz9SlNBCIIJxiGKuAu47Bsbp0GCohqCPOt+pelvyMpXG/x5f8tI7iOGyO
         19zeNEtB9pZK9BWJKZpJB+njQu+ox3GcxA/rqzPpWyWJPbDPJGO2zMQq9SFMqwB22qWD
         dDZvjcbw3hWdzHG29HSrfwtQG7nJdw8jKmMOGj5bSKl601za4gi9X0KXgWM+oVp2GEaQ
         WSx+7JBx8KvpXBvrhGZTFdw9skf9iZmEk5qSeus14RgllWYe2MpqduOfoAEMNzB7lPMS
         nK1w==
X-Gm-Message-State: AAQBX9d/4G8HDnnVePYgCS9DL/7P5TxNDlFxOXZ2mfQYS8sTKmD0s3iy
        unzKFYSW8/4Pyw6zA5Zg+jvj/CnUqrnFOrd1VlS0Tg==
X-Google-Smtp-Source: AKy350ZyfnicVq9xecC/cC1mTDZhCHjWOqp/2nJcdrBu/oIOWBtM6+bAVzgkT5VAJEKwRmPLudwBtg==
X-Received: by 2002:a17:907:96a0:b0:8b1:75a5:4a92 with SMTP id hd32-20020a17090796a000b008b175a54a92mr11439418ejc.72.1682347201792;
        Mon, 24 Apr 2023 07:40:01 -0700 (PDT)
Received: from [10.105.146.163] ([88.128.92.195])
        by smtp.gmail.com with ESMTPSA id a11-20020a17090682cb00b0094f5179540fsm5534014ejy.83.2023.04.24.07.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 07:40:01 -0700 (PDT)
Message-ID: <07db634b-ebc6-666f-eb2e-6bc9c6008040@linaro.org>
Date:   Mon, 24 Apr 2023 16:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Include in next: krzk/linux-w1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Please kindly include in the linux-next my new tree:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-w1.git

branch: for-next
branch for pending-fixes: fixes

Repo will be collecting patches for W1 subsystem which recently I took over:
https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/char-misc.git/commit/?h=char-misc-next&id=6f36ff32809aeaa7276d5f663d7adf9298a8bf5c

The patches in the tree will be sent to Greg KH.

Best regards,
Krzysztof
